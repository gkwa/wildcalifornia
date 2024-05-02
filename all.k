{examples = [



{
txtar = r"""
-- nginx.yml --
---
- hosts: localhost
  connection: local
  become: true

  tasks:
    - name: Install nginx
      ansible.builtin.package:
        name: nginx
        state: present
-- run --
ansible-playbook nginx.yml
"""
}

{


notes = r"""
Example of how to install many packages in one call to ansible.builtin.package


"""

txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  tasks:
   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
         - nginx
       state: present
-- run --
ansible-playbook mypackages.yml
"""

output = r"""
root@ip-172-31-31-195:~/wildcalifornia# ansible-playbook mypackages.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] *********************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia#
"""


}



{
txtar = r"""
-- mypackages.yml --
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /usr/bin/python3

  tasks:
   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
-- run --
ansible-playbook mypackages.yml
"""


output = r"""


root@ip-172-31-31-195:~/wildcalifornia# bash -ex run
+ ansible-playbook mypackages.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] *********************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
cat myok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
p       ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia# cat mypackages.yml
---
- hosts: localhost
  connection: local
  become: true

  vars:
    ansible_python_interpreter: /usr/bin/python3

  tasks:
   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
       state: present
root@ip-172-31-31-195:~/wildcalifornia#

"""

}



{


txtar=r"""


-- inventory.yml --

---
all:
  hosts:
    localhost:
      ansible_connection: local




-- playbook.yml --


---
- hosts: all
  become: true

  tasks:
   - name: Install jq and nginx
     ansible.builtin.package:
       name:
         - jq
         - nginx
       state: present


-- run --

ansible-playbook -i inventory.yml playbook.yml

"""


notes = r"""
This is the first to not give inventory warning, yay!

"""


output = r"""

root@ip-172-31-31-195:~/wildcalifornia# bash -ex run
+ ansible-playbook -i inventory.yml playbook.yml

PLAY [all] ***************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [localhost]

TASK [Install jq and nginx] **********************************************************************************************************************************
ok: [localhost]

PLAY RECAP ***************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

root@ip-172-31-31-195:~/wildcalifornia#

"""






}



]

}
