<?xml version='1.1' encoding='UTF-8'?>
<slave>
  <name>docker-node</name>
  <description>docker-node</description>
  <remoteFS>/home/jenkins/</remoteFS>
  <numExecutors>1</numExecutors>
  <mode>EXCLUSIVE</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
  <launcher class="hudson.plugins.sshslaves.SSHLauncher" plugin="ssh-slaves@1.806.v2253cedd3295">
    <host>containers.do1.exam</host>
    <port>22</port>
    <credentialsId>ssh</credentialsId>
    <launchTimeoutSeconds>60</launchTimeoutSeconds>
    <maxNumRetries>10</maxNumRetries>
    <retryWaitTime>15</retryWaitTime>
    <sshHostKeyVerificationStrategy class="hudson.plugins.sshslaves.verifiers.KnownHostsFileKeyVerificationStrategy"/>
    <tcpNoDelay>true</tcpNoDelay>
  </launcher>
  <label>docker-node</label>
  <nodeProperties/>
</slave>