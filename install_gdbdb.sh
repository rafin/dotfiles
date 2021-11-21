wget -P ~ git.io/.gdbinit
mkdir -p ~/.gdbinit.d
wget 'https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/python/lib/gdb/FrameDecorator.py' -O ~/.gdbinit.d/FrameDecorator.py
sed -i '1s/^/python gdb.COMPLETE_EXPRESSION = gdb.COMPLETE_SYMBOL\n/' .gdbinit
cat >> .gdbinit <<EOF
python
import imp
gdb.FrameDecorator = imp.new_module('FrameDecorator')
gdb.FrameDecorator.FrameDecorator = FrameDecorator
end
EOF
