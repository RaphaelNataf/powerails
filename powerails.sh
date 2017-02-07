# Powerails.sh by f0ster
variablesModel=();
function installRVM () {
  read -p "Do you have RVM installed? [yY/nN]" inputRVM
  if [[ $inputRVM == "y" || $inputRVM == "Y" ]]; then
    echo "\033[32mWe're installing Ruby 2.3.3 for you...\033[0m"
    rvm install ruby-2.3.3;
    echo "\033[32mRuby installed correctly. Now installing Rails...\033[0m"
    sudo gem install rails;
    echo "\033[32mInstalling your depedencies... (Bundle Install)\033[0m"
    bundle install;
    echo "All done, Ruby on Rails is ready !"
  fi
  if [[ $inputRVM == "n" || $inputRVM == "N" ]]; then
    echo "\033[31mPlease install RVM before anything else (rvm.io)\033[0m"
    wget https://get.rvm.io | bash -s stable;
  fi
}
function initProject () {
  echo "\033[32mCreating a new Rails project in your current directory...\033[0m"
    rails new . ;
  echo "New project created with success."
}
function createModel () {
  read -p "What's the name of this controller ?" inputModelName
  echo " "
  read -p "Do you want to add a variable in this model ? [yY/nN]" inputSelection
  echo " "
  while [[ $inputSelection == "y" || $inputSelection == "Y" ]]
    do
      read -p "Please enter the name of it (ex: view_count:integer)" inputModel
      echo " "
      variablesModel+=("$inputModel")
      read -p "Do you want to add another variable in this model ? [yY/nN]" inputSelection
      echo " "
  done
  echo "\033[32mCreating a new Model ($inputModelName)...\033[0m"
  echo "\033[0m"
    rails g model $inputModelName ${variablesModel[@]}
    # echo ${variablesModel[@]}
  echo "\033[32mNew Model ($inputModelName) created with success."
  echo "\033[0m"
}
function createView () {
  read -p "What's the name of this View ?" inputViewName
  echo "\033[32mCreating a new View ($inputViewName)...\033[0m"
    rails g model $inputViewName 
  echo "\033[32mNew View ($inputViewName) created with success."
}
function createController () {
  read -p "What's the name of this Controller ?" inputControllerName
  echo "\033[32mCreating a new Controller ($inputControllerName)...\033[0m"
  echo " "
    rails g controller $inputControllerName 
  echo "\033[32mNew Controller ($inputControllerName) created with success.\033[0m"
  echo " "
}
function installMate () {
  echo "\033[32mInstalling the gems...\033[0m"
  gem install rails;
  echo "\033[32mInstalling its bundles...\033[0m"
  bundle install;
  echo "\033[32mReseting DB...\033[0m"
  rake db:reset;
  echo "\033[32mMigrating the DB...\033[0m"
  rake db:migrate;
  echo "\033[34mIt's all ready to use !\033[0m"
}
function displayMenu () {

echo "---------------------------------------------------------------------------"
echo "     *                            *                                 *      "
echo "        ______________                                   *                 "
echo "       //  __________/  SIMPLE RUBY ON RAILS GUI BY                        "
echo "      //  /____   _________  _________  ___________  ________  __________  "
echo "     //  _____/  // ____  / //  _____/ //___   ___/ //  ____/ //  ___   /  "
echo "    //  /       // /   / / //  /___       //  /    //  /___  //  /__/  /   "
echo "   //  /       // /   / / //___   /      //  /    //  ____/ //    ____/    "
echo "  //  /       // /___/ / ____//  /      //  /    //  /___  //  /\  \       "
echo " //__/       //_______/ //_____ /      //__/    //______/ //__/  \__\      "
echo "    *                                *                         *           "
echo "                  *                                *                       "
echo "---------------------------------------------------------------------------"
echo "\033[34mPowerails.sh \033[0mis intended to be OpenSource for all your \033[31mRuby On Rails\033[0m needs."
echo "Please enjoy using it. Any other use is not the responsibility of the developer."
echo ""
PS3='Your choice [n]: '
echo "\033[32mBe sure you re in the path of your rails folder."
echo "\033[0m"
options=("Install rails" "Initialize a new project" "Start server" "Migrate DB" "Create a new Model" "Create a new View" "Create a new Controller" "Add smthg to smthg" "Reset DB (if r.sh exists)" "Install the project of a friend" "Exit Powerails")
select opt in "${options[@]}"
do
    case $opt in
    	"Install rails")
			echo "-----------------------------"
            echo "\033[30m  	Installing rails for you!"
            echo "\033[0m"
            installRVM;
            break
            ;;
        "Initialize a new project")
			echo "---------------------------------------"
            echo "\033[31m     I'm about to code :'( "
            echo "\033[0m"
            initProject;
            break
            ;;
        "Start server")
      echo "---------------------------------------"
            echo "\033[31m    @_@ I can see my shitcode @_@"
            echo "\033[0m"
            rails s;
            break
            ;;
        "Migrate DB")
      echo "---------------------------------------"
            echo "\033[31m    ## Sending DATAs to The Matrix ##"
            echo "\033[0m"
            rake db:migrate;
            break
            ;;
        "Create a new Model")
			echo "---------------------------"
            echo "\033[31m   A Model, Again ?"
            echo "\033[0m"
            createModel;
            break
            ;;
        "Create a new View")
			echo "---------------------------"
            echo "\033[31m  	Yay! A new page."
            echo "\033[0m"
            createView;
            break
            ;;
        "Create a new Controller")
      echo "---------------------------"
            echo "\033[31m    OK, a new controller."
            echo "\033[0m"
            createController;
            break
            ;;
        "Reset DB (if r.sh exists)")
      echo "----------------------------------------------------"
      echo "\033[31m    Let's see the routes..."
            echo "\033[0m"
            ./r.sh;
            break
            ;;
        "Install the project of a friend")
      echo "----------------------------------------------------"
      echo "\033[31m    Installing this project for you sir!"
            echo "\033[0m"
            installMate;
            break
            ;;
        "Add smthg to smthg")
			echo "----------------------------------"
            echo "\033[31m  	You could have thought about it earlier"
            echo "\033[0m"
            
            break
            ;;
        "Exit Powerails")
            break
            ;;
        *) echo invalid option;;
    esac
done
}
displayMenu;
