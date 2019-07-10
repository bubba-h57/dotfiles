cd ~/Library/Fonts

fontname="Sauce Code Pro Black Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Black-Italic/complete/Sauce%20Code%20Pro%20Black%20Italic%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Black Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Black/complete/Sauce%20Code%20Pro%20Black%20Nerd%20Font%20Complete.ttf
fi
 
fontname="Sauce Code Pro Bold Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Bold-Italic/complete/Sauce%20Code%20Pro%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Bold Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Bold/complete/Sauce%20Code%20Pro%20Bold%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro ExtraLight Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Extra-Light/complete/Sauce%20Code%20Pro%20ExtraLight%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro ExtraLight Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/ExtraLight-Italic/complete/Sauce%20Code%20Pro%20ExtraLight%20Italic%20Nerd%20Font%20Complete.ttf
fi
 
fontname="Sauce Code Pro Light Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Light-Italic/complete/Sauce%20Code%20Pro%20Light%20Italic%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Light Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Light/complete/Sauce%20Code%20Pro%20Light%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Medium Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Medium-Italic/complete/Sauce%20Code%20Pro%20Medium%20Italic%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Medium Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete.ttf
fi
 
fontname="Sauce Code Pro Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Semibold Italic Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Semibold-Italic/complete/Sauce%20Code%20Pro%20Semibold%20Italic%20Nerd%20Font%20Complete.ttf
fi

fontname="Sauce Code Pro Semibold Nerd Font Complete.ttf"
if [ ! -f ~/Library/Fonts/$fontname ]; then
    curl -fLo $fontname https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Semibold/complete/Sauce%20Code%20Pro%20Semibold%20Nerd%20Font%20Complete.ttf
fi

cd ~/Library/Application\ Support/iTerm2/DynamicProfiles

name="iterm2.default.profile.json"
if [ ! -f $name ]; then
    curl -fLo $name https://github.com/bubba-h57/dotfiles/raw/master/.config/oh-my-zsh/plugins/bubba-nerdfont/iterm2.default.profile.json
fi

cd ~