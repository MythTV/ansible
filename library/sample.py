#!/usr/bin/python
#!/home/bill/.virtualenvs/mythtv/bin/python

#### This is coppied from another module and would need to be re-written
#### to to whatever is needed. Additional files can be added just like
#### this with other module names.

''' Overall comment here '''

# Copyright: (c) 2025,  Bill Meek based on Ansible documentation
# GNU General Public License v3.0+ (see COPYING or
# https://www.gnu.org/licenses/gpl-3.0.txt)

# pylint: disable=invalid-name
__metaclass__ = type
# pylint: enable=invalid-name

from ansible.module_utils.basic import AnsibleModule  # nopep8


def run_module():
    ''' Update with real module information. '''

    module_args = {
        'api_port': {
            'type': 'int',
            'required': False,
            'default': 6544
            },
        'host': {
            'type': 'str',
            'required': False,
            'default': 'localhost'
            },
        }

    module = AnsibleModule(argument_spec=module_args, supports_check_mode=True)

    result = {'changed': False}

    # In the check mode, really a sanity test of this module.
    if module.check_mode:
        result['comment'] = 'check mode ran'
        module.exit_json(**result)

    # Do something(s) here and resurn result information.

    result['changed'] = True
    result['comment'] = 'library/sample.py ran'
    result['host'] = module.params['host']
    result['api_port'] = module.params['api_port']

    module.exit_json(**result)


def main():
    ''' Common for all modules '''

    run_module()


if __name__ == '__main__':
    main()
