# MouseVader-Nesto

THIS IS A NESTO-CUSTOMIZED FORK: We rewrote the extension to only work for DataDog dashboards. We want to prevent them to refresh the page on inactivity.

Many companies including Facebook and Google do track their users behavior on their own websites or on the websites of other companies or people using their services. This simply works by tracking the user behavior as in interest in different website areas via tracking the user's mouse pointer when it hovers on elements of the rendered HTML page. This way, based on your behavior, you can be classified into cluster groups for easier targeting of ad campaigns. You can clearly see this ongoing tracking by simply observing the network tab on your browser when you merely hover on any element of the page.

The purpose of this extension is to subvert and circumvent this tracking tactic by creating fake random mouse events while you are staying on any web page to simulate actual user behavior but in a totally random way. So your actual behavioral data would be diluted purposefully with random and irrelevant data which, with time, would make it pretty difficult for tracking services to build a profile of you.

# Scripts

- `./scripts/nesto-build`
- `./scripts/nesto-test`: You must create .env with the dashboard url to test before running it