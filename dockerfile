FROM httpd
COPY index.html /usr/local/apache2/htdocs
EXPOSE 80

#Groovy format to build dodcker image and container using jenkins

pipeline{
    agent any
    
    stages{
        stage ('checkout') {
            steps {
                git branch : "main" , url : "https://github.com/manu-peter/jenkins.git"
            }
        }
        
        stage ('build') {
            steps{
                echo "building..."
                sh 'ls'
                sh 'pwd'
                sh 'echo admin123 | sudo -S docker build -t jenkinsimg1 .'
                sh 'echo admin123 | sudo -S docker images'
            }
        }
        stage('Container') {
           steps {
                   sh 'echo admin123 | sudo -S docker run -d -p 9090:80 --name jenkins jenkinsimg1'   #Make sure to give the same image name as the container name
                }
        }
    }
}
