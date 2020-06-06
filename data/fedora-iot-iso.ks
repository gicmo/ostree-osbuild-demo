# Kickstart defaults file for an interative install.
# This is not loaded if a kickstart file is provided on the command line.
firstboot --enable

%anaconda
# Default password policies
pwpolicy root --notstrict --minlen=6 --minquality=1 --nochanges --notempty
pwpolicy user --notstrict --minlen=6 --minquality=1 --nochanges --emptyok
pwpolicy luks --notstrict --minlen=6 --minquality=1 --nochanges --notempty
# NOTE: This applies only to *fully* interactive installations, partial kickstart
#       installations use defaults specified in pyanaconda/pwpolicy.py.
#       Automated kickstart installs simply ignore the password policy as the policy
#       only applies to the UI, not for passwords specified in kickstart.
%end
ostreesetup --nogpg --osname=fedora-iot --remote=fedora-iot --url=file:///ostree/repo --ref=@REF@
firewall --use-system-defaults
%post --erroronfail
rm -f /etc/ostree/remotes.d/fedora-iot.conf
ostree remote add --set=gpg-verify=false fedora-iot '@REMOTE_URL@'
cp /etc/skel/.bash* /root
%end
