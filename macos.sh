# clean brew cache
rm -rf "$(brew --cache)"


# reset permitions
tccutil reset All com.surteesstudios.Bartender;


# touchid sudo
cd /etc/pam.d/
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo nano /etc/pam.d/sudo_local
# uncomment or add auth sufficient pam_tid.so


# wifi reset
sudo ifconfig en0 down ; sudo ifconfig en0 up


# brew update everything
echo "brew updates everything" ; brew upgrade --cask --greedy ; echo "casks updated" ;  brew update && brew outdated ; brew upgrade && brew cleanup; 


# ffmpeg
# convert mp3 to wav
ffmpeg -i file_name.mp3 -vn -ar 44100 -ac 2 -b:a 128k file_name.wav

# extract audio to wav 
ffmpeg -i file_name.mp4  -vn -ar 44100 -ac 2 -b:a 128k  file_name.wav


# reload ohmyzsh
omz reload
