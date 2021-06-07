node{
    
    def buildNumber = BUILD_NUMBER
    
    
    stage('Git Checkout'){
        git 'https://github.com/nikhilnk436/batch10.git'
    }
    stage('clean package'){
        
        def mavenHome = tool name: "Maven", type: "maven"
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('docker build image'){
        
        sh "docker build -t test183/casestudy:${buildNumber} ."
    }
    stage('docker push'){
        withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_secret')]) {
         sh "docker login -u test183 -p ${docker_secret}"        
            
        }
                sh "docker push  test183/casestudy:${buildNumber} ";
                echo 'docker push completed';   
        ansiblePlaybook credentialsId: 'ansible_secret', disableHostKeyChecking: true, playbook: '/home/ubuntu/initiate-install-devops.yaml'   ;
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "success CI: Project name -> ${env.JOB_NAME}", to: "hynfin@gmail.com";  
    }        
}




