repo_dir="/home/$USER/Repositories";

git clone https://github.com/Nozomi-Soft/env-configuration.git "$repo_dir/env-configuration";

git clone https://github.com/google/styleguide.git "$repo_dir/styleguide";

git clone https://github.com/Nozomi-Soft/common-lib.git "$repo_dir/common-lib";

git clone https://github.com/Nozomi-Soft/rest-user.git "$repo_dir/rest-user";

git clone https://github.com/Nozomi-Soft/nozomi-web.git "$repo_dir/nozomi-web";

chown -R $USER:$USER $repo_dir/*;