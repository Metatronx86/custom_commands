#!/bin/bash

OPTION="$1"
DFILENAME="$2"
DUSERNAME="YOUR_GITHUB_USERNAME"
DTOKEN="YOUR_PERSONAL_ACCESS_TOKEN"
DEMAIL="YOUR_REGISTERED_GITHUB_EMAIL"
NUSERNAME="$3"
NTOKEN="$4"
NEMAIL="$5"
EFFT="effortlessly."
P1="ghp_ek81wkYt15bHQzABMQVeFpiNRNcrpy46Hqc7"
P2="ek81wkYt15bHQzABMQVeFpiNRNcrpy46Hqc7"
ANYWHERE="Simply run(from anywhere in your environment)"
STRT="You can now"
SUP="to setup"
SDIR=~/.my_cmds
TILDE=~"/"
SHOW=".my_cmds"
FILEPATH=~/$SHOW/.set
HODN=".scpts"


echo -e "\n.....Hey! ....."
mkdir -p $SDIR


#...options display.................. #

echo ""
#...Script files.................. #
echo -e "[a] or [A] - $SUP push(sync) command"
echo -e "[b] or [B] - $SUP pull command"
echo -e "[c] or [C] - $SUP create repo command(Without opening the github website)"
echo -e "[d] or [D] - $SUP clone repo command"
echo -e "[e] or [E] - $SUP compile command (with options including common flags)"
echo -e "[f] or [F] - $SUP a default C source file template"
echo -e "[g] or [G] - $SUP and use \"cls\" command to clear"
echo -e "[h] or [H] - $SUP Github Author Identity(Global and Local) command"
#...C files....................... #
echo -e "[i] or [I] - $SUP a Guessing Game command(To unwind)"
echo -e "[j] or [J] - $SUP a Rot13 Cipher command"
echo -e "[k] or [K] - $SUP a Rot47 Cipher command"
echo -e "[l] or [L] - $SUP a simple ASCII table command"
#................................. #
echo ""

echo -n "What do you want to do? [q] - quit >>> "
read OPTION


#...functions .................. #

scptcpy()
{
	cp "$HODN/$DFILENAME" "$SDIR/$DFILENAME"
}

Ccpy()
{
	cp "$HODN/$DFILENAME.c" "$SDIR/$DFILENAME.c"
}

empt()
{
	local var="$1"

	if [[ -z "$var" ]]; then
		echo ""
		echo -e "Field cannot be empty."
		echo ""
		exit 1
	fi
}

pchk()
{
	local NUM1=36
	local NUM2=${#NTOKEN}

	if [[ $NUM2 != $NUM1 ]]; then
		echo -e ""
		echo -e "TOKEN: $NTOKEN which you supplied is not a classic token."
		echo -e "Make sure to remove \"ghp_\" and there is no whitespace."
		echo ""
		exit 1
	fi
}

streamedit()
{
	local var1="$1"
    local var2="$2"

	sed -i "s/$var1/$var2/g" "$SDIR/$DFILENAME"
}

unametokenmaill()
{
	local vname="$1"

	echo -n "Kindly Enter your Github Username >>> "
	read NUSERNAME
	empt "$NUSERNAME"
	echo -e "........................................................"
	echo -e "Example of what the token will be is $P2"
	echo -e "Recall that $P1 = ghp_ + $P2"
	echo -e "What you need to supply is $P2 and leave out the rest."
	echo -e "........................................................"
	echo -n "Your Classic Github token >>> "
	read NTOKEN
	pchk
	empt "$NTOKEN"
	echo -n "Lastly, your Github Email >>> "
	read NEMAIL
	empt "$NEMAIL"
	echo ""
	echo -e "Confirm your details:"
	echo -e ".................................."
	echo -e "Username: $NUSERNAME"
	echo -e "Token: ghp_$NTOKEN"
	echo -e "Email: $NEMAIL"
	echo -e ".................................."
	echo -n "Chech that these are correct. Are they? [y/N] >>> "
	read ANS
	echo ""
	if [[ ${#ANS} =~ 1 && ("$ANS" =~ "y" || "$ANS" =~ "Y") ]]; then
		cp "$HODN/$vname" "$SDIR/$DFILENAME"
		streamedit "$DUSERNAME" "$NUSERNAME"
		streamedit "$DTOKEN" "$NTOKEN"
		streamedit "$DEMAIL" "$NEMAIL"
	elif [[ ${#ANS} =~ 1 && ("$ANS" =~ "n" || "$ANS" =~ "N") ]]; then
		echo -e "Ok."
		echo ""
		exit 1
	else
		echo -e "You must provide these information to proceed"
		echo ""
		exit 1
	fi
}

Exit() 
{
    if [[ -z "$OPTION" || $OPTION =~ "q" || $OPTION =~ "Q" ]]; then
		if [[ $OPTION =~ "q" || $OPTION =~ "Q" ]]; then
			echo -e "Cheers!"
		else
			echo -e "You must select an option"
		fi
		echo ""
		exit 1
	fi
}

options()
{
	if [[ $OPTION =~ "a" || $OPTION =~ "A" ]]; then
		RES="a"
	elif [[ $OPTION =~ "b" || $OPTION =~ "B" ]]; then
		RES="b"
	elif [[ $OPTION =~ "c" || $OPTION =~ "C" ]]; then
		RES="c"
	elif [[ $OPTION =~ "d" || $OPTION =~ "D" ]]; then
		RES="d"
	elif [[ $OPTION =~ "e" || $OPTION =~ "E" ]]; then
		RES="e"
	elif [[ $OPTION =~ "f" || $OPTION =~ "F" ]]; then
		RES="f"
	elif [[ $OPTION =~ "g" || $OPTION =~ "G" ]]; then
		RES="g"
	elif [[ $OPTION =~ "h" || $OPTION =~ "H" ]]; then
		RES="h"
	# ............................................................ #
	elif [[ $OPTION =~ "i" || $OPTION =~ "I" ]]; then
		RES="i"
	elif [[ $OPTION =~ "j" || $OPTION =~ "J" ]]; then
		RES="j"
	elif [[ $OPTION =~ "k" || $OPTION =~ "K" ]]; then
		RES="k"
	elif [[ $OPTION =~ "l" || $OPTION =~ "L" ]]; then
		RES="l"
	fi

	#....tags............................. #
	
	if [[ $RES =~ "a" || $RES =~ "b" || $RES =~ "c" || $RES =~ "d" ||
		$RES =~ "e" || $RES =~ "f" || $RES =~ "g" || $RES =~ "h" ]]; then
		FILETYPE="script"
	elif [[ $RES =~ "i" || $RES =~ "j" || $RES =~ "k" || $RES =~ "l" ]]; then
		FILETYPE="cfile"
	fi
}

#..................... #
# calculate_sum() 
# {
#     local sum=$(( $1 + $2 ))
#     result=$sum
# }
# calculate_sum 5 3
# echo "Sum: $result"
#..................... #


#... command assignment.................. #

if [[  -z "$OPTION" || ${#OPTION} =~ 1 ]]; then

	Exit
	options

	if [[ $RES =~ "a" ]]; then
		DFILENAME="push"
	elif [[ $RES =~ "b" ]]; then
		DFILENAME="pull"
	elif [[ $RES =~ "c" ]]; then
		DFILENAME="createRepo"
	elif [[ $RES =~ "d" ]]; then
		DFILENAME="cloneRepo"
	elif [[ $RES =~ "e" ]]; then
		DFILENAME="mycompile"
	elif [[ $RES =~ "f" ]]; then
		DFILENAME="ctemp"
	elif [[ $RES =~ "g" ]]; then
		DFILENAME="cls"
	elif [[ $RES =~ "h" ]]; then
		DFILENAME="authorID"
	# ............................................................ #
	elif [[ $RES =~ "i" ]]; then
		DFILENAME="guessGame"
	elif [[ $RES =~ "j" ]]; then
		DFILENAME="rot13"
	elif [[ $RES =~ "k" ]]; then
		DFILENAME="rot47"
	elif [[ $RES =~ "l" ]]; then
		DFILENAME="myascii"
	else
		echo -e "You can only choose from the options provided"
		exit 1
	fi

	
	#....C/script............................. #

	echo -e "\nCreating $DFILENAME as a command..."

	if [[ $FILETYPE =~ "script" ]]; then
		echo -e "TEXT" >  $SDIR/$DFILENAME
		chmod 744 $SDIR/$DFILENAME
	elif [[ $FILETYPE =~ "cfile" ]]; then
		echo -e "TEXT" >  $SDIR/$DFILENAME.c
	fi


	#...creating variable and profile.................. #

	if ! grep -q .my_cmds ~/.bashrc; then
		echo -e "Setting up variable..."
		echo 'export PATH="$PATH:~/.my_cmds"' >> ~/.bashrc
	else
		echo -e "Variable good..."
	fi

	if ! grep -q  bashrc ~/.bash_profile; then
		echo -e "Setting up profile...\n"
		echo '[ -r ~/.bashrc ] && . ~/.bashrc ' >> ~/.bash_profile
	else
		echo -e "Profile good..."
	fi


	echo ""

	if [[ $RES =~ "a" ]]; then
		scptcpy
	elif [[ $RES =~ "b" ]]; then
		scptcpy
	elif [[ $RES =~ "c" ]]; then
		unametokenmaill "createRepoGeneral"
	elif [[ $RES =~ "d" ]]; then
		unametokenmaill "cloneRepoGeneral"
	elif [[ $RES =~ "e" ]]; then
		scptcpy
	elif [[ $RES =~ "f" ]]; then
		echo -e "TEXT" >  $SDIR/C_template.c
		cp "$HODN/C_template.c" "$SDIR/C_template.c"
		scptcpy
	elif [[ $RES =~ "g" ]]; then
		scptcpy
	elif [[ $RES =~ "h" ]]; then
		scptcpy
	# ............................................................ #
	elif [[ $RES =~ "i" ]]; then
		Ccpy
	elif [[ $RES =~ "j" ]]; then
		Ccpy
	elif [[ $RES =~ "k" ]]; then
		Ccpy
	elif [[ $RES =~ "l" ]]; then
		Ccpy
	fi


	#....make............................. #

	if [[ $FILETYPE =~ "cfile" ]]; then
		make $SDIR/$DFILENAME
	fi


	#...instructions(how to use).................. #	

	echo ""
	echo -e "Now, RESTART YOUR TERMINAL or START A NEW SESSION."

	if [[ $RES =~ "a" ]]; then
		echo -e "$STRT push(sync) to github. $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "b" ]]; then
		echo -e "$STRT pull from github. $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "c" ]]; then
		echo -e "$STRT create a github repo right from your terminal. $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "d" ]]; then
		echo -e "$STRT clone repos from github. $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "e" ]]; then
		echo -e "$STRT compile your files $EFFT $ANYWHERE: $DFILENAME <filename>"
	elif [[ $RES =~ "f" ]]; then
		echo -e "$STRT create default C source file templates $EFFT $ANYWHERE: $DFILENAME <filename>"
	elif [[ $RES =~ "g" ]]; then
		echo -e "$STRT clear your screen $EFFT $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "h" ]]; then
		echo -e "$STRT configure your GitHub identity both globally and locally within your environment $EFFT $ANYWHERE: $DFILENAME"
	# ............................................................ #
	elif [[ $RES =~ "i" ]]; then
		echo -e "$STRT play guessing game $EFFT $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "j" ]]; then
		echo -e "$STRT encode and decode your texts with Rot13 $EFFT $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "k" ]]; then
		echo -e "$STRT encode and decode your texts with Rot47 $EFFT $ANYWHERE: $DFILENAME"
	elif [[ $RES =~ "l" ]]; then
		echo -e "$STRT check the ASCII table $EFFT $ANYWHERE: $DFILENAME"
	fi

	echo -e "\ncompleted."

else
	echo -e "Invalid! You must select an option"
	echo ""
	exit 1
fi
