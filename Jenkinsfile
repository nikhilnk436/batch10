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
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/home/ubuntu/reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
    }        
}



