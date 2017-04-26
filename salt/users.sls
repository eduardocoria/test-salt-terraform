testuser0:
  group:
    - present
  user:
    - present
    - groups:
      - testuser0
    - require:
      - group: testuser0

testuser1:
  group:
    - present
  user:
    - present
    - groups:
      - testuser1
    - require:
      - group: testuser1

testuser2:
  group:
    - present
  user:
    - present
    - groups:
      - testuser2
    - require:
      - group: testuser2


sshkeyt0:
  ssh_auth.present:
    - user: testuser0
    - source: '/home/ubuntu/key.pub'
    - config: '/home/testuser0/.ssh/authorized_keys'

sshkeyt1:
  ssh_auth.present:
    - user: testuser1
    - source: '/home/ubuntu/key.pub'
    - config: '/home/testuser1/.ssh/authorized_keys'

sshkeyt2:
  ssh_auth.present:
    - user: testuser2
    - source: '/home/ubuntu/key.pub'
    - config: '/home/testuser2/.ssh/authorized_keys'
