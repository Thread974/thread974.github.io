build:
	hugo --themesDir=themes --theme=hugo-universal-theme

serve:
	hugo serve

view:
	firefox localhost:3333

push:
	git push -f github.io

upload:
	cd public && (											\
		echo "cd www"										\
		echo "bin"											\
		find * -type d | while read var ; do				\
			echo "mkdir \$var"								\
		done												\
		find * -type f | while read var ; do				\
			echo "put \$var \$var"							\
		done												\
		echo "You can now run: make upload-for-real"		\
	) | cat 

upload-for-real:
	make upload | sftp -o PubKeyAuthentication=no mbj@vtt-jacou34.net
