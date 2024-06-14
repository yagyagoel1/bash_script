#!/bin/bash
set -eou pipefail

check_awscli(){
	if ! command -v aws &> /dev/null;
		echo "aws cli is not installed please install it first" >&2
		return 1
	fi
}

install_awscli(){
	echo "installing aws cli v2 on linux..."
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
	sudo apt-get install -y unzip &> /dev/null


	unzip -q awscliv2.zip

	sudo ./aws/install

	#verify installation 
	aws --version 

	#cleanup
	rm -rf awscliv2.zip ./aws

}

wait_for_instance(){
	local instance_id="$1"
	echo "waiting for instance $instance_id to be in running state.."
	while true; do
		state=$$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
		if [[ "$state" == "running" ]]; 
		then 
			echo "Instance $instance_id is now running"
			break
		fi 
		sleep 10 
	done 
}

create_ec2_instance(){
	local ami_id="$1"
	local instance_type="$2"
	local key_name="$3"
	local subnet_id="$4"
	local security_group_ids="$5"
	local instance_name="$6"

#run aws cli command to create ec2 instance 
instance_id=$(aws ec2 run-instances \
	--image-id "$ami_id" \
	--instance-type "$instance_type"
--key-name "$key_name" \
	--subnet-id "$subnet_id" \
	--security-group-ids "$security_group_ids" \
	--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$insatnce_name}]" /
--query 'Instances[0].InstanceId' \
	--ouptput text
)
if [[ -z "$instance_id" ]]; then 
	echo "Failed to create EC2 ISNTANCE" >&2
	exit 1
fi 
echo "Instance $instance_id created successfully"

#wati for the instance to be in runnign state 
wait_for_instance "$instance_id"
}
main(){
	if  ! check_awscli;
	then 
		install_awscli || exit 1
	fi

echo "Creating EC2 instance..."

# Specify the parameters for creating the EC2 instance 
AMI_ID=""
INSTANCE_TYPE="t2.micro"
KEY_NAME=""
SUBNET_IF=""
SECURITY_GROUP_IDS="" # Add your security group IDs seprated by space
INSTANCE_NAME="Shell-Script-EC2-Demo"

#call the function to create the EC2 instance
create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"
 
echo "EC2 instance creation completed"
}
main "$@"


