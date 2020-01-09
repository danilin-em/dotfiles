# -*- coding: utf-8 -*-

"""DBus Display Manager Session Lock.

File: dbus_session_lock.py

@author Evgenii Danilin <evgenii.danilin.m@gmail.com
@url    https://github.com/danilin-em/dbus_session_lock

"""

import dbus

SERVICE_NAME = 'org.freedesktop.DisplayManager'
SERVICE_PATH = '/org/freedesktop/DisplayManager/Session0'
SESSION_SERVICE_NAME = '{service}.Session'.format(service=SERVICE_NAME)


def get_session_iface():
    """Display manager session interface.

    Returns:
        bus.Interface
    """
    bus = dbus.SystemBus()
    proxy = bus.get_object(SERVICE_NAME, SERVICE_PATH)
    return dbus.Interface(proxy, dbus_interface=SESSION_SERVICE_NAME)


def lock():
    """Lock Screen."""
    session_iface = get_session_iface()
    session_iface.Lock()


if __name__ == '__main__':
    lock()
