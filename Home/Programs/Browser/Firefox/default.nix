{pkgs, lib, config, ...}:{
  home.file.".mozilla/firefox/daru/chrome".source = config.lib.file.mkOutOfStoreSymlink ./chrome;
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      daru = {
        name = "daruFox";
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          behave
          boring-rss
          cliget
          decentraleyes
          disable-javascript
          edit-with-emacs
          don-t-fuck-with-paste
          disconnect
          enhanced-github
          enhancer-for-youtube
          firefox-color
          violentmonkey
          firenvim
          github-file-icons
          gitako-github-file-tree
          i-dont-care-about-cookies
          hover-zoom-plus
          image-search-options
          keepassxc-browser
          multi-account-containers
          no-pdf-download
          re-enable-right-click
          simplelogin
          skip-redirect
          sponsorblock
          stylus
          terms-of-service-didnt-read
          temporary-containers
          translate-web-pages
          ublock-origin
          unpaywall
          web-archives
          widegithub
          tabcenter-reborn
          ];
        isDefault = true;
        search = {
          default = "Brave Search";
          force = true;
          engines = {
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
            "Brave Search" = {
              urls = [
              {template = "https://search.brave.com/search?q={searchTerms}";}
              ];
              iconUpdateURL = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/brave-logo-dark.62301cdf.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@br"];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                  ];
               }];
             icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
            };
          };
        };
        settings = {
          "browser.disableResetPrompt" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "dom.security.https_only_mode" = true;
          "identity.fxaccounts.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "signon.rememberSignons" = true;
          "browser.backspace_action" = 0;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.download.panel.shown" = false;
          "browser.download.useDownloadDir" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" =false;
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.search.suggest.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.tabs.warnOnClose" = true;
          "browser.startup.page" = 3;
          "browser.translations.panelShown" = true;
          "browser.urlbar.quicksuggest.scenario" = "history";
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.topsites" = false;

          "firefoxone.rhythm_sound_tab" = true;
          "firefoxone.selected_tab_gradient_border" = true;
          "firefoxone.style_without_leftsidebar" = true;
          "firefoxone.tree_tabs_style" = true;
          "firefoxone.without-default-colors" = true;

          "gfx.webrender.all" = true;
          "layers.acceleration.force-enabled" = true;

          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.downloads" = false;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.sessions" = false;

          "privacy.donottrackheader.enabled" = true;
          "svg.context-properties.content.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "layout.css.color-mix.enabled" = true;
          "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
          "layout.css.backdrop-filter.enabled" = true;

          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "privacy.userContext.longPressBehavior" = 2;

        };
      };
    };
  };
}
