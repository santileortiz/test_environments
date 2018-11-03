# Test Environments
This was my attempt at creating virtualized environments for desktop applicaion
testing.

For this I considered several alternatives including chroot, schroot,
systemd-nspawn and Docker. All of these options provide diferent levels of
virtualization. At first I thought Docker to be overkill, because it tried to
isolate as much as possible the host and the guest systems, and in application
testing we usually still want access to all the hardware available from the host
system including networking, graphics card, audio etc. Turns out everything is much
more complicated and I went through a long journey of containerization.



To test desktop applications in different distributions we usually want most
services from the host system to also be available inside the container. This
is the opposite from the problem projects like Docker solve which is to have
an environmet as isolated as possible from the host system, and with the
minimum components necessary for a service to run.

For desktop application development we want the complete opposite. We want an
environment that has access to all hardware from the host system, and that is
as similar as possible to a full user installation of an operating system.

# System Isolation
Testing an application means building and running the application in an
environment with two different kinds of settings. First the status of installed
packages and their versions, and second the runtime configuration of the user's
session. Bugs may happen in either one of these.

These scripts focus on quickly testing for the first kind of bugs. Because we
try as much as we can to reuse all runtime services from the host, problems may
arise if the host and the chroot system are very different. This also means
that bugs related to these runtime services can't be reliably debugged.

Examples of this runtime things that are reused are: dbus' session, X11's session
created via Xauth, environment variables.
