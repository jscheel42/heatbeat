node {
   stage('Preparation') { 
      git 'https://github.com/jscheel42/heatbeat'
      sh 'mix local.hex --force'
      sh 'mix deps.get'
      sh 'mix local.rebar --force'
   }
   stage('Build') {
      sh 'MIX_ENV=prod mix compile'
      sh 'mix docker.build'
      sh 'mix docker.release'
   }
   stage('Publish') {
      sh 'docker tag jscheel42/heatbeat:release jscheel42/heatbeat:latest'
      sh 'docker push jscheel42/heatbeat:latest'

   }
   stage('DB_Migrate') {
       sh './ci_vars.sh config/prod.exs'
       sh 'MIX_ENV=prod mix ecto.create'
       sh 'MIX_ENV=prod mix ecto.migrate'
   }
   stage('Deploy') {
       sh './ci_vars.sh docker-compose-ci.yml'
       sh 'scp docker-compose-ci.yml heatbeat@joshuascheel.com:~/docker-compose.yml'
       sh 'ssh heatbeat@joshuascheel.com \'docker-compose -f docker-compose.yml down\''
       sh 'ssh heatbeat@joshuascheel.com \'docker-compose -f docker-compose.yml pull\''
       sh 'ssh heatbeat@joshuascheel.com \'docker-compose -f docker-compose.yml up -d\''
   }
}
