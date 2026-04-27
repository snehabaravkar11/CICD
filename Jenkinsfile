pipeline{
agent any
stages 
{
stage('Build') 
{
steps{
echo "Building the Project.........."
}
}
stage('Test') 
{
steps{
pip install -r requirements.txt
robot tests/api/users_api.robot
}
}
stage('Deploy') 
{
steps{
echo "Deploying the Project.........."
}
}
}
}
