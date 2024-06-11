swank() {
    ros run --eval '(ql:quickload :swank)' --eval '(format t ";; CTRL-D to close")'  --eval '(swank:create-server :dont-close t)'
}
