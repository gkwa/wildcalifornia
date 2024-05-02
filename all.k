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

}



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









]

}
