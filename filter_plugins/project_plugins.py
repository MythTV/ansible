#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2025, Bill Meek <bmeek@mythtv.org>

''' git log filter. Use this to view documentation:
    ANSIBLE_FILTER_PLUGINS=./filter_plugins ansible-doc -t filter git_log_info
'''


# pylint: disable=import-outside-toplevel,useless-object-inheritance
class FilterModule(object):
    ''' Class required by Ansible for filter plugins '''

    def filters(self):
        '''  Add filters in the return{} below '''

        return {
            'git_log_info': self.git_log_info,
            'something_else': self.something_else
        }

    def git_log_info(self, file_path, scope='playbook'):
        ''' See if PATH is set, look for git in it and return git log
            information if the file is under git control. Else N/A.
            Also allow getting the SHA1 for HEAD, so that the version
            of the entire project can be retrieved.
        '''

        import os
        import subprocess

        getenv_path = os.getenv('PATH')

        if not getenv_path:
            return "no PATH set, not running git"

        git_executable_found = False

        for path in getenv_path.split(sep=':'):
            git_executable_found = os.path.isfile(path + '/git')
            if git_executable_found:
                break

        if not git_executable_found:
            return 'git executable not found in PATH'

        if scope == 'playbook':
            args = ['log', '-n1', '--pretty=format:"%H"', 'HEAD']
        elif scope == 'full':
            args = ['log', '-n1', '--pretty=format:"%h by %an on %aD"', '--',
                     file_path]
        elif scope == 'long':
            args = ['log', '-n1', '--pretty=format:"%H"', '--', file_path]
        else:
            return 'invalid scope, use {playbook (default)|full|long}'

        process = subprocess.run(['git'] + args, capture_output=True,
                                 text=True, check=False)

        data = process.stdout
        result = process.returncode

        if not data or result != 0:
            return 'N/A'

        return data.strip('"')

    def something_else(self, some_argument):
        ''' Place holder for some other filter. Mostly here to prove that
            multiple filters can live in a single Python file.
        '''

        return some_argument
