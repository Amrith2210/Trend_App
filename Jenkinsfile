stage('Build & Push') {
  steps {
    sh 'docker build -t <DOCKERHUB_USER>/trend-app:${BUILD_NUMBER} .'
    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DU', passwordVariable: 'DP')]) {
      sh 'echo $DP | docker login -u $DU --password-stdin'
      sh 'docker push <DOCKERHUB_USER>/trend-app:${BUILD_NUMBER}'
      sh 'docker tag <DOCKERHUB_USER>/trend-app:${BUILD_NUMBER} <DOCKERHUB_USER>/trend-app:latest'
      sh 'docker push <DOCKERHUB_USER>/trend-app:latest'
    }
  }
}
stage('Deploy to EKS') {
  steps {
    sh 'kubectl set image deployment/trend-deployment trend=<DOCKERHUB_USER>/trend-app:latest --record'
  }
}
