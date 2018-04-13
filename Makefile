excludes = --exclude ".git/" --exclude ".DS_Store" --exclude "Makefile" \
    --exclude "README.md" --exclude ".gitmodules" --exclude "*.git" \
    --exclude "hosts"


all: vim install


vim:
	# Vim packages
	mkdir ~/.vim
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
	git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim


check:
	rsync $(excludes) -avh --no-perms --dry-run . ~;


install:
	rsync $(excludes) -avh --no-perms . ~;
