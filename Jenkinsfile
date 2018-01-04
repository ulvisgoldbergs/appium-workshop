branch = '2017'
repoAppium = 'https://github.com/ulvisgoldbergs/appium-workshop.git'

node('AppiumBuildAgent'){
    stage 'Prepare'
        cloneRepo()
        prepEnv()
    stage 'Run'
        runTest()
    stage 'Report'
        cucumberReport()
        archiveArtifacts()
}

def cloneRepo(){
    checkout(
        [$class: 'GitSCM',
        branches: [[name: "*/${branch}"]],
        doGenerateSubmoduleConfigurations: false,
        extensions: [[$class: 'CleanCheckout']],
        submoduleCfg: [],
        userRemoteConfigs: [[url: repoAppium]]])
}

def prepEnv(){
    sh "ls"
    sh "gem install bundler"
    sh "bundle install"
}

def runTest(){
    sh "ruby main.rb -r json"
}

def cucumberReport(){
    cucumber fileIncludePattern: '*.json',
    jsonReportDirectory: 'reports/',
    parallelTesting: true,
    sortingMethod: 'ALPHABETICAL'
}

def archiveArtifacts(){
    archiveArtifacts artifacts: 'reports/*, *.logs, *apk',
    fingerprint: true
}