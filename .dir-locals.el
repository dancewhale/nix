((nil . (
	(ssh-deploy-root-local . "/Users/whale/Work/nix/")
	(ssh-deploy-root-remote . "/ssh:root@10.211.55.9:/root/nix/")
	(ssh-deploy-async . 1)
	(ssh-deploy-on-explicit-save . 1)
	(ssh-deploy-script . (lambda() (let ((default-directory ssh-deploy-root-remote))(shell-command "bash compile.sh"))))
)))
