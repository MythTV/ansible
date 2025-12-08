#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2025, Bill Meek <bmeek@mythtv.org>

'''
Just another example of a filter, see:
    ansible-doc --type filter mythtv.general.yet_another_filter
'''

# pylint: disable=import-outside-toplevel,useless-object-inheritance
class FilterModule(object):
    ''' Class required by Ansible for filter plugins '''

    def filters(self):
        '''  Add filters in the return{} below '''

        return {
            'yet_another_filter': self.yet_another_filter,
        }

    def yet_another_filter(self, some_argument):
        '''
        Place holder for some other filter. Mostly here to prove that multiple
        filters can live in a single Python file.
        '''

        return some_argument
