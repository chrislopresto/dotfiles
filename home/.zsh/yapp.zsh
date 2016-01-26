alias yappee="rake enable:editor"
alias yapped="rake enable:dashboard"
alias yappep="rake enable:preview"
alias yappea="rake enable:account"

function webflow {
  cd ~/Downloads
  unzip -a yapphome.webflow.zip -d yapphome-webflow
  cd yapphome-webflow
  mv -f images/* ~/p/yappbox/projects/yapp-server/public/images
  mv -f css/* ~/p/yappbox/projects/yapp-server/app/assets/webflow/css
  cd ~/p/yappbox/projects/yapp-server/app/assets/webflow/css
  rm yapphome.webflow.css.scss
  mv yapphome.webflow.css yapphome.webflow.css.scss
  cd -
  mv -f js/* ~/p/yappbox/projects/yapp-server/app/assets/webflow/js
}
