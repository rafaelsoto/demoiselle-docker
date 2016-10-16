node (){
  stage ('Build and Test'){
  env.PATH = "${tool 'M3'}/bin:${env.PATH}"
  env.JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home"
  //Apenas para execucao local
  git 'https://github.com/rafaelsoto/demoiselle-docker.git'

  //checkout scm
  sh 'mvn clean package -Dmaven.test.skip=true'
  archive 'target/*.war'
  }
  stage ('Docker Packaging'){
  docker.build('rafikdabahia/demoiselle-docker')
  }
 }
