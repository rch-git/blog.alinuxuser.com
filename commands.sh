##### INITIAL REPO SETUP #####

# set username, email and set rebase when pulling
sysuser@ubuntuprod:~/git/alinuxuser (master -> origin/master)$ git config user.name "RC" && git config user.email "alinuxuser@fastmail.com"

# verify details.
sysuser@ubuntuprod:~/git/alinuxuser (dev -> origin/dev)$ git config --local -l

# set email
# sysuser@ubuntuprod:~/git/alinuxuser (master -> origin/master)$ git config user.email "alinuxuser@fastmail.com"

# rebase when pulling
# git config pull.rebase true

# create local branch named dev
git checkout -b dev

# set upstream branch to dev
git push -u origin dev

##### SETUP HUGO PROJECT #####

# install hugo
sudo snap install hugo --channel=extended/stable

# run the command from inside alinuxuser directory
sysuser@ubuntuprod:~/git/thelocalhoster$ hugo new site . --force --format yaml

# install PaperMod theme. this needs to be done every time the repository is recreated.
# https://github.com/adityatelange/hugo-PaperMod/wiki/Installation
git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1

# rename hugo.yaml to config.yaml
mv ~/git/alinuxuser/hugo.yaml ~/git/alinuxuser/config.yaml

# Create netlify.toml and add build options

# create a new hugo post
sysuser@ubuntuprod:~/git/alinuxuser (dev -> origin/dev)$ hugo new posts/2017/02/reviews/witcher2-review.md
sysuser@ubuntuprod:~/git/alinuxuser (dev -> origin/dev)$ hugo new drafts/2023/12/2023-12-22-assassinscreedorigins-diary.md

##### ONE LINE COMMAND TO PUSH CHANGES TO MASTER AND SWITCH BACK #####
# run this from the root directory
git checkout master && git pull && git merge dev && git push && git checkout dev
git checkout master && git pull && git merge --squash dev && git commit -m "Squash merge dev" && git push && git checkout dev
# force dev into master, push to origin
git checkout master && git fetch && git reset --hard origin/dev && git push --force && git checkout dev

# fetch dev from origin and replace local with remote
git fetch origin && git reset --hard origin/dev

# if master and dev became different, and force changes from dev into master
git checkout master
git reset --hard dev
git push --force
