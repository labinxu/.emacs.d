# CMake generated Testfile for 
# Source directory: /Users/labinxu/.emacs.d/modules/irony-mode/server/test/elisp
# Build directory: /Users/labinxu/.emacs.d/irony/build/test/elisp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(irony-el "/Applications/emacs.app/Contents/MacOS/Emacs" "-batch" "-l" "package" "--eval" "(package-initialize) (unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "/Users/labinxu/.emacs.d/modules/irony-mode/server/test/elisp/irony.el" "-f" "ert-run-tests-batch-and-exit")
add_test(irony-cdb-json-el "/Applications/emacs.app/Contents/MacOS/Emacs" "-batch" "-l" "package" "--eval" "(package-initialize) (unless (require 'cl-lib nil t) (package-refresh-contents) (package-install 'cl-lib))" "-l" "/Users/labinxu/.emacs.d/modules/irony-mode/server/test/elisp/irony-cdb-json.el" "-f" "ert-run-tests-batch-and-exit")
