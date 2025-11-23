# ELO Project Website: Comprehensive UX & Navigation Guide

This document summarizes the analysis of the ELO crypto project's website theme, color strategy, and provides detailed recommendations for improving the User Experience (UX) and Navigation structure based on the provided React routing.

![Alt text](image/GEMMINI.JPG "Screenshot of Home page")

## I. Theme, Color, and Audience Analysis

### A. Core Identity & Color Palette

The design utilizes a contrast between **Bright Green** and **White/Light Gray** to establish a brand identity centered on:

* **Bright Green (e.g., #4AD04A):** Financial growth, health, vitality, energy, and positive Call-to-Action (CTA).
* **White/Light Gray:** Clarity, cleanliness, modernity, and excellent readability.

### B. Most Suitable Target Audience

The theme is highly effective for audiences situated at the intersection of:

1.  **Crypto Investors & Speculators:** Seeking new ICOs and high-growth potential.
2.  **Fintech Startups:** Wanting a modern, trustworthy, and digitally focused appearance.
3.  **Food & Loyalty Users:** Interested in better, decentralized rewards ("Eat-to-Earn").

---

## II. Strategic Navigation Structure & Grouping

The current flat list of routes should be organized into clear categories within the `MainNavigation` to enhance discoverability and guide users effectively.

| Group (Primary Menu Item) | Routes Included | UX Purpose |
| :--- | :--- | :--- |
| **1. The Project** | `/`, `/about`, `/gallery` | **Informational Hub:** Builds foundational trust and explains the mission. |
| **2. Buy ELO** | `/pre-sale`, `/swap`, `/onramp` | **Conversion Funnel:** Groups all methods of acquisition (ICO, exchange, fiat on-ramp). |
| **3. Utility & Earn** | `/stake`, `/mint`, `/nfts` | **Incentive Center:** Highlights high-value activities for token holders (yield, creation, collection). |
| **4. Wallet & History** | `/erc20balance`, `/transactions` | **Account Management:** Allows users to easily check balances and transaction history. |

### Navigation Implementation Details

* **Make it Sticky:** The `MainNavigation` and the main action button **must be sticky** at the top of the viewport for continuous access.
* **Action Button:** The most prominent CTA should dynamically switch:
    * **Logged Out:** **"Connect Wallet"** (Use the Bright Green color prominently)
    * **Logged In:** Display **Shortened Wallet Address** (e.g., `0x89...2f34`) for quick access to account details.

---

## III. Concrete User Experience (UX) Improvement Guide

### A. Global Trust & Transparency (Critical for Crypto)

| Area | Improvement Action | Why? |
| :--- | :--- | :--- |
| **Security Proof** | Dedicate a section/page to **Team & Audit**. Link directly to the **CertiK/Security Audit Report**. | Builds immediate, non-negotiable trust with investors. |
| **Tokenomics** | On the `/pre-sale` page, use a simple **visual infographic/table** (not just the whitepaper) for supply, allocation, and vesting schedules. | Simplifies complex financial data for quick decision-making. |
| **Team Credibility** | Add a prominent **Team & Advisors** section with professional photos, names, and verified links (LinkedIn/Twitter). | Adds accountability and humanizes the project. |

### B. Conversion & Utility Route Enhancements

| Route | Recommended UX Improvements |
| :--- | :--- |
| **`/pre-sale`** | 1. **Countdown Timer:** Highly visible timer for the current phase's end. 2. **Progress Bar:** Live counter showing "$X Million Raised" or "Y% of Tokens Sold." 3. **3-Step Guide:** Simple, visual instructions: Connect $\to$ Enter Amount $\to$ Confirm. |
| **`/swap`** | 1. **Clear Transaction Details:** Display estimated gas fees, slippage tolerance, and minimum received amount *before* confirmation. 2. **Max/Half Buttons:** Quick selection buttons next to input fields for asset selection. |
| **`/stake`** | 1. **Prominent APY:** Display the Annual Percentage Yield (APY) clearly and in a large font. 2. **Visual Lock Status:** Use clear indicators to show locked vs. unlocked tokens and remaining lock time. |
| **`/mint` & `/nfts`** | **Visual Grid Layout:** Use a responsive grid with large, high-quality images. Provide clear metadata and status labels (e.g., "Minted," "Unclaimed," "Rarity: Legendary"). |

### C. Error and Loading States

| Component | Improvement Action |
| :--- | :--- |
| **Unauthenticated State** | Replace the simple message with a dedicated, branded component saying: **"Access Restricted."** Include a clear, large **"Connect Wallet"** button as the only action. |
| **Loading Data** | Implement **Skeleton Loading Screens** (gray boxes replacing content) for components waiting on blockchain data (`/erc20balance`, `/transactions`). |
| **General Errors** | Provide clear, contextual error messages (e.g., "Transaction Failed: Insufficient Gas" or "Invalid Network Selected"). |

# Build issues

<details>
<summary>Too many warnings and deprecated libraries
</summary>
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/core@3.9.3
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from @material-ui/core@3.9.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core
npm warn   @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn   1 more (material-ui-pickers)
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn     @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn     1 more (material-ui-pickers)
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/core@3.9.3
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from @material-ui/core@3.9.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core
npm warn   @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn   1 more (material-ui-pickers)
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn     @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn     1 more (material-ui-pickers)
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: focus-trap-react@6.0.0
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn node_modules/mdbreact/node_modules/focus-trap-react
npm warn   focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn   node_modules/mdbreact/node_modules/focus-trap-react
npm warn     focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: focus-trap-react@6.0.0
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn node_modules/mdbreact/node_modules/focus-trap-react
npm warn   focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn   node_modules/mdbreact/node_modules/focus-trap-react
npm warn     focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: material-ui-pickers@2.2.4
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from material-ui-pickers@2.2.4
npm warn node_modules/mdbreact/node_modules/material-ui-pickers
npm warn   material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from material-ui-pickers@2.2.4
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers
npm warn     material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: material-ui-pickers@2.2.4
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from material-ui-pickers@2.2.4
npm warn node_modules/mdbreact/node_modules/material-ui-pickers
npm warn   material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from material-ui-pickers@2.2.4
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers
npm warn     material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-chartjs-2@2.9.0
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn node_modules/mdbreact/node_modules/react-chartjs-2
npm warn   react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn   node_modules/mdbreact/node_modules/react-chartjs-2
npm warn     react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-chartjs-2@2.9.0
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn node_modules/mdbreact/node_modules/react-chartjs-2
npm warn   react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn   node_modules/mdbreact/node_modules/react-chartjs-2
npm warn     react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-image-lightbox@5.1.1
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.x" from react-image-lightbox@5.1.1
npm warn node_modules/mdbreact/node_modules/react-image-lightbox
npm warn   react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.x" from react-image-lightbox@5.1.1
npm warn   node_modules/mdbreact/node_modules/react-image-lightbox
npm warn     react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-image-lightbox@5.1.1
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.x" from react-image-lightbox@5.1.1
npm warn node_modules/mdbreact/node_modules/react-image-lightbox
npm warn   react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.x" from react-image-lightbox@5.1.1
npm warn   node_modules/mdbreact/node_modules/react-image-lightbox
npm warn     react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-scroll@1.7.16
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn node_modules/mdbreact/node_modules/react-scroll
npm warn   react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn   node_modules/mdbreact/node_modules/react-scroll
npm warn     react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-scroll@1.7.16
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn node_modules/mdbreact/node_modules/react-scroll
npm warn   react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn   node_modules/mdbreact/node_modules/react-scroll
npm warn     react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn deprecated crypto@1.0.1: This package is no longer supported. It's now a built-in Node module. If you've depended on crypto, you should switch to the one that's built-in.
npm warn deprecated safe-event-emitter@1.0.1: Renamed to @metamask/safe-event-emitter
npm warn deprecated @walletconnect/types@1.8.0: WalletConnect's v1 SDKs are now deprecated. Please upgrade to a v2 SDK. For details see: https://docs.walletconnect.com/
npm warn deprecated @npmcli/move-file@1.1.2: This functionality has been moved to @npmcli/fs
npm warn deprecated inflight@1.0.6: This module is not supported, and leaks memory. Do not use it. Check out lru-cache if you want a good and tested way to coalesce async requests by a key value, which is much more comprehensive and powerful.
npm warn deprecated mkdirp-promise@5.0.1: This package is broken and no longer maintained. 'mkdirp' itself supports promises now, please switch to that.
npm warn deprecated npmlog@6.0.2: This package is no longer supported.
npm warn deprecated @walletconnect/mobile-registry@1.4.0: Deprecated in favor of dynamic registry available from: https://github.com/walletconnect/walletconnect-registry
npm warn deprecated rimraf@3.0.2: Rimraf versions prior to v4 are no longer supported
npm warn deprecated eth-sig-util@1.4.2: Deprecated in favor of '@metamask/eth-sig-util'
npm warn deprecated eth-json-rpc-infura@5.1.0: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated glob@7.2.3: Glob versions prior to v9 are no longer supported
npm warn deprecated level-errors@1.0.5: Superseded by abstract-level (https://github.com/Level/community#faq)
npm warn deprecated memdown@1.4.1: Superseded by memory-level (https://github.com/Level/community#faq)
npm warn deprecated rollup-plugin-inject@3.0.2: This package has been deprecated and is no longer maintained. Please use @rollup/plugin-inject.
npm warn deprecated har-validator@5.1.5: this library is no longer supported
npm warn deprecated deferred-leveldown@1.2.2: Superseded by abstract-level (https://github.com/Level/community#faq)
npm warn deprecated ethereumjs-block@2.2.2: New package name format for new versions: @ethereumjs/block. Please update.
npm warn deprecated are-we-there-yet@3.0.1: This package is no longer supported.
npm warn deprecated react-image-lightbox@5.1.1: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated sourcemap-codec@1.4.8: Please use @jridgewell/sourcemap-codec instead
npm warn deprecated yaeti@0.0.6: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated level-codec@7.0.1: Superseded by level-transcoder (https://github.com/Level/community#faq)
npm warn deprecated multicodec@1.0.4: This module has been superseded by the multiformats module
npm warn deprecated ethereumjs-tx@2.1.2: New package name format for new versions: @ethereumjs/tx. Please update.
npm warn deprecated uuid@2.0.1: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm warn deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm warn deprecated @walletconnect/client@1.8.0: WalletConnect's v1 SDKs are now deprecated. Please upgrade to a v2 SDK. For details see: https://docs.walletconnect.com/
npm warn deprecated multibase@0.6.1: This module has been superseded by the multiformats module
npm warn deprecated multibase@0.7.0: This module has been superseded by the multiformats module
npm warn deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
npm warn deprecated uuid@3.3.2: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm warn deprecated gauge@4.0.4: This package is no longer supported.
npm warn deprecated @walletconnect/ethereum-provider@1.8.0: Reliability and performance improvements. See: https://github.com/WalletConnect/walletconnect-monorepo/releases
npm warn deprecated multicodec@0.5.7: This module has been superseded by the multiformats module
npm warn deprecated eip1193-provider@1.0.1: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
npm warn deprecated abstract-leveldown@2.6.3: Superseded by abstract-level (https://github.com/Level/community#faq)
npm warn deprecated @walletconnect/web3-provider@1.8.0: WalletConnect's v1 SDKs are now deprecated. Please upgrade to a v2 SDK. For details see: https://docs.walletconnect.com/
npm warn deprecated abstract-leveldown@2.7.2: Superseded by abstract-level (https://github.com/Level/community#faq)
npm warn deprecated ethereumjs-block@1.7.1: New package name format for new versions: @ethereumjs/block. Please update.
npm warn deprecated @material-ui/system@3.0.0-alpha.2: You can now upgrade to @mui/system. See the guide: https://mui.com/guides/migration-v4/
npm warn deprecated @json-rpc-tools/provider@1.7.6: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated ethereumjs-vm@2.6.0: New package name format for new versions: @ethereumjs/vm. Please update.
npm warn deprecated levelup@1.3.9: Superseded by abstract-level (https://github.com/Level/community#faq)
npm warn deprecated @json-rpc-tools/utils@1.7.6: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated @json-rpc-tools/types@1.7.6: Package no longer supported. Contact Support at https://www.npmjs.com/support for more info.
npm warn deprecated ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
npm warn deprecated cids@0.7.5: This module has been superseded by the multiformats module
npm warn deprecated @walletconnect/qrcode-modal@1.8.0: WalletConnect's v1 SDKs are now deprecated. Please upgrade to a v2 SDK. For details see: https://docs.walletconnect.com/
npm warn deprecated web3-provider-engine@16.0.1: This package has been deprecated, see the README for details: https://github.com/MetaMask/web3-provider-engine
npm warn deprecated popper.js@1.16.1: You can find the new Popper v2 at @popperjs/core, this package is dedicated to the legacy v1
npm warn deprecated material-ui-pickers@2.2.4: You can now upgrade to @material-ui/pickers. Documentation for v2 can be found at https://material-ui-pickers-v2.dmtr-kovalenko.now.sh/
npm warn deprecated core-js@1.2.7: core-js@<3.23.3 is no longer maintained and not recommended for usage due to the number of issues. Because of the V8 engine whims, feature detection in old core-js versions could cause a slowdown up to 100x even if nothing is polyfilled. Some versions have web compatibility issues. Please, upgrade your dependencies to the actual version of core-js.
npm warn deprecated @mui/base@5.0.0-beta.40-1: This package has been replaced by @base-ui-components/react
npm warn deprecated @material-ui/core@3.9.3: Material UI v4 doesn't receive active development since September 2021. See the guide https://mui.com/material-ui/migration/migration-v4/ to upgrade to v5.
npm warn deprecated core-js@2.6.12: core-js@<3.23.3 is no longer maintained and not recommended for usage due to the number of issues. Because of the V8 engine whims, feature detection in old core-js versions could cause a slowdown up to 100x even if nothing is polyfilled. Some versions have web compatibility issues. Please, upgrade your dependencies to the actual version of core-js.
</details>

<details>
<summary>An issue was there due to web3 version</summary>
Uncaught TypeError: Cannot read properties of undefined (reading 'slice')
    at node_modules/hash-base/node_modules/readable-stream/lib/_stream_writable.js (_stream_writable.js:57:81)
    at __require2 (chunk-I4DOGHKO.js?v=f78aa34d:17:50)
    at node_modules/hash-base/node_modules/readable-stream/readable-browser.js (readable-browser.js:4:20)
    at __require2 (chunk-I4DOGHKO.js?v=f78aa34d:17:50)
    at node_modules/hash-base/index.js (index.js:5:17)
    at __require2 (chunk-I4DOGHKO.js?v=f78aa34d:17:50)
    at node_modules/md5.js/index.js (index.js:3:16)
    at __require2 (chunk-I4DOGHKO.js?v=f78aa34d:17:50)
    at node_modules/create-hash/md5.js (md5.js:1:11)
    at __require2 (chunk-I4DOGHKO.js?v=f78aa34d:17:50)
</details>

Than I run
```
npm install web3@4
```

<details>
<summary>59 vulnerabilities (10 low, 16 moderate, 29 high, 4 critical)</summary>
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/core@3.9.3
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from @material-ui/core@3.9.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core
npm warn   @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn   1 more (material-ui-pickers)
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn     @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn     1 more (material-ui-pickers)
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/core@3.9.3
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from @material-ui/core@3.9.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core
npm warn   @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn   1 more (material-ui-pickers)
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn     @material-ui/core@"3.9.3" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn     1 more (material-ui-pickers)
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: focus-trap-react@6.0.0
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn node_modules/mdbreact/node_modules/focus-trap-react
npm warn   focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn   node_modules/mdbreact/node_modules/focus-trap-react
npm warn     focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: focus-trap-react@6.0.0
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn node_modules/mdbreact/node_modules/focus-trap-react
npm warn   focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"0.14.x || ^15.0.0 || ^16.0.0" from focus-trap-react@6.0.0
npm warn   node_modules/mdbreact/node_modules/focus-trap-react
npm warn     focus-trap-react@"^6.0.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: material-ui-pickers@2.2.4
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from material-ui-pickers@2.2.4
npm warn node_modules/mdbreact/node_modules/material-ui-pickers
npm warn   material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from material-ui-pickers@2.2.4
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers
npm warn     material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: material-ui-pickers@2.2.4
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from material-ui-pickers@2.2.4
npm warn node_modules/mdbreact/node_modules/material-ui-pickers
npm warn   material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from material-ui-pickers@2.2.4
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers
npm warn     material-ui-pickers@"2.2.4" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-chartjs-2@2.9.0
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn node_modules/mdbreact/node_modules/react-chartjs-2
npm warn   react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn   node_modules/mdbreact/node_modules/react-chartjs-2
npm warn     react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-chartjs-2@2.9.0
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn node_modules/mdbreact/node_modules/react-chartjs-2
npm warn   react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^0.14.0 || ^15.0.0 || ^16.0.0-beta || ^16.0.0" from react-chartjs-2@2.9.0
npm warn   node_modules/mdbreact/node_modules/react-chartjs-2
npm warn     react-chartjs-2@"2.9.0" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-image-lightbox@5.1.1
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.x" from react-image-lightbox@5.1.1
npm warn node_modules/mdbreact/node_modules/react-image-lightbox
npm warn   react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.x" from react-image-lightbox@5.1.1
npm warn   node_modules/mdbreact/node_modules/react-image-lightbox
npm warn     react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-image-lightbox@5.1.1
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.x" from react-image-lightbox@5.1.1
npm warn node_modules/mdbreact/node_modules/react-image-lightbox
npm warn   react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.x" from react-image-lightbox@5.1.1
npm warn   node_modules/mdbreact/node_modules/react-image-lightbox
npm warn     react-image-lightbox@"5.1.1" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-scroll@1.7.16
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn node_modules/mdbreact/node_modules/react-scroll
npm warn   react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn   node_modules/mdbreact/node_modules/react-scroll
npm warn     react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-scroll@1.7.16
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn node_modules/mdbreact/node_modules/react-scroll
npm warn   react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^15.5.4 || ^16.0.0" from react-scroll@1.7.16
npm warn   node_modules/mdbreact/node_modules/react-scroll
npm warn     react-scroll@"1.7.16" from mdbreact@5.2.0
npm warn     node_modules/mdbreact
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @react-bootstrap/react-popper@1.2.1
npm warn Found: react@17.0.2
npm warn node_modules/react
npm warn   peer react@">=16.0.0" from @ant-design/icons@4.8.3
npm warn   node_modules/@ant-design/icons
npm warn     @ant-design/icons@"^4.8.2" from antd@4.24.16
npm warn     node_modules/antd
npm warn     1 more (the root project)
npm warn   78 more (@ant-design/react-slick, @emotion/react, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"0.14.x || ^15.0.0 || ^16.0.0" from @react-bootstrap/react-popper@1.2.1
npm warn node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper
npm warn   @react-bootstrap/react-popper@"1.2.1" from react-bootstrap@1.0.0-beta.5
npm warn   node_modules/react-bootstrap
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"0.14.x || ^15.0.0 || ^16.0.0" from @react-bootstrap/react-popper@1.2.1
npm warn   node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper
npm warn     @react-bootstrap/react-popper@"1.2.1" from react-bootstrap@1.0.0-beta.5
npm warn     node_modules/react-bootstrap
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/system@3.0.0-alpha.2
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn   @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/system@3.0.0-alpha.2
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn   @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/system@3.0.0-alpha.2
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/system
npm warn     @material-ui/system@"^3.0.0-alpha.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/utils@3.0.0-alpha.3
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from @material-ui/utils@3.0.0-alpha.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/utils
npm warn   @material-ui/utils@"^3.0.0-alpha.2" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from @material-ui/utils@3.0.0-alpha.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/utils
npm warn     @material-ui/utils@"^3.0.0-alpha.2" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: @material-ui/utils@3.0.0-alpha.3
npm warn Found: react-dom@17.0.1
npm warn node_modules/mdbreact/node_modules/react-dom
npm warn   react-dom@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   3 more (react-transition-group, react-transition-group, react-transition-group)
npm warn
npm warn Could not resolve dependency:
npm warn peer react-dom@"^16.3.0" from @material-ui/utils@3.0.0-alpha.3
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/utils
npm warn   @material-ui/utils@"^3.0.0-alpha.2" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react-dom@16.14.0
npm warn node_modules/react-dom
npm warn   peer react-dom@"^16.3.0" from @material-ui/utils@3.0.0-alpha.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/@material-ui/utils
npm warn     @material-ui/utils@"^3.0.0-alpha.2" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-event-listener@0.6.7
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from react-event-listener@0.6.7
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/react-event-listener
npm warn   react-event-listener@"^0.6.2" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from react-event-listener@0.6.7
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/react-event-listener
npm warn     react-event-listener@"^0.6.2" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: recompose@0.30.0
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^0.14.0 || ^15.0.0 || ^16.0.0" from recompose@0.30.0
npm warn node_modules/mdbreact/node_modules/@material-ui/core/node_modules/recompose
npm warn   recompose@"0.28.0 - 0.30.0" from @material-ui/core@3.9.3
npm warn   node_modules/mdbreact/node_modules/@material-ui/core
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^0.14.0 || ^15.0.0 || ^16.0.0" from recompose@0.30.0
npm warn   node_modules/mdbreact/node_modules/@material-ui/core/node_modules/recompose
npm warn     recompose@"0.28.0 - 0.30.0" from @material-ui/core@3.9.3
npm warn     node_modules/mdbreact/node_modules/@material-ui/core
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: react-event-listener@0.6.7
npm warn Found: react@17.0.1
npm warn node_modules/mdbreact/node_modules/react
npm warn   react@"17.0.1" from mdbreact@5.2.0
npm warn   node_modules/mdbreact
npm warn     mdbreact@"^5.1.0" from the root project
npm warn   4 more (react-transition-group, react-transition-group, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^16.3.0" from react-event-listener@0.6.7
npm warn node_modules/mdbreact/node_modules/material-ui-pickers/node_modules/react-event-listener
npm warn   react-event-listener@"^0.6.6" from material-ui-pickers@2.2.4
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^16.3.0" from react-event-listener@0.6.7
npm warn   node_modules/mdbreact/node_modules/material-ui-pickers/node_modules/react-event-listener
npm warn     react-event-listener@"^0.6.6" from material-ui-pickers@2.2.4
npm warn     node_modules/mdbreact/node_modules/material-ui-pickers
npm warn ERESOLVE overriding peer dependency
npm warn While resolving: create-react-context@0.2.3
npm warn Found: react@17.0.2
npm warn node_modules/react
npm warn   peer react@">=16.0.0" from @ant-design/icons@4.8.3
npm warn   node_modules/@ant-design/icons
npm warn     @ant-design/icons@"^4.8.2" from antd@4.24.16
npm warn     node_modules/antd
npm warn     1 more (the root project)
npm warn   78 more (@ant-design/react-slick, @emotion/react, ...)
npm warn
npm warn Could not resolve dependency:
npm warn peer react@"^0.14.0 || ^15.0.0 || ^16.0.0" from create-react-context@0.2.3
npm warn node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper/node_modules/create-react-context
npm warn   create-react-context@"^0.2.1" from @react-bootstrap/react-popper@1.2.1
npm warn   node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper
npm warn
npm warn Conflicting peer dependency: react@16.14.0
npm warn node_modules/react
npm warn   peer react@"^0.14.0 || ^15.0.0 || ^16.0.0" from create-react-context@0.2.3
npm warn   node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper/node_modules/create-react-context
npm warn     create-react-context@"^0.2.1" from @react-bootstrap/react-popper@1.2.1
npm warn     node_modules/react-bootstrap/node_modules/@react-bootstrap/react-popper

added 35 packages, removed 34 packages, changed 11 packages, and audited 1537 packages in 18s

170 packages are looking for funding
  run `npm fund` for details

59 vulnerabilities (10 low, 16 moderate, 29 high, 4 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues possible (including breaking changes), run:
  npm audit fix --force

Some issues need review, and may require choosing
a different dependency.

Run `npm audit` for details.
</details>

## Suggessions

Update latest libraries. In recent time, a VAPT for our one of project to compy with HIPAA has reported this as Medium vulnarability. Hence we upgraded from angular version from 14 to 19. 

<details>
<summary>Relavant requirements</summary>
* OWASP Top 10 2021: A06:2021 – Vulnerable and Outdated Components
* CWE-829: Inclusion of Functionality from Untrusted Control Sphere
* CWE-79: Cross-site Scripting
</details>

