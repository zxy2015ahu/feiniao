import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import tailwind from "@astrojs/tailwind";
import partytown from "@astrojs/partytown";

const googleAnalyticsId = "G-EC75P3JKR5";

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: "Flutter Distributor",
      logo: {
        src: "./src/assets/logo.png",
      },
      editLink: {
        baseUrl:
          "https://github.com/leanflutter/flutter_distributor/tree/main/website/",
      },
      defaultLocale: "root",
      locales: {
        root: {
          label: "English",
          lang: "en",
        },
        "zh-hans": {
          label: "简体中文",
          lang: "zh-hans",
        },
      },
      social: {
        github: "https://github.com/leanflutter/flutter_distributor",
        discord: "https://discord.com/invite/zPa6EZ2jqb",
      },
      sidebar: [
        {
          label: "Guides",
          translations: { "zh-hans": "指南" },
          items: [
            {
              label: "Getting started",
              link: "/getting-started/",
              translations: { "zh-hans": "开始" },
            },
            {
              label: "Distribute Options",
              link: "/distribute-options/",
              translations: { "zh-hans": "分发选项" },
            },
            { label: "CLI", link: "/cli/" },
          ],
        },
        {
          label: "Makers",
          translations: { "zh-hans": "制作器" },
          items: [
            { label: "aab", link: "/makers/aab/" },
            { label: "apk", link: "/makers/apk/" },
            { label: "appimage", link: "/makers/appimage/" },
            { label: "deb", link: "/makers/deb/" },
            { label: "dmg", link: "/makers/dmg/" },
            { label: "exe", link: "/makers/exe/" },
            { label: "ipa", link: "/makers/ipa/" },
            { label: "msix", link: "/makers/msix/" },
            { label: "pkg", link: "/makers/pkg/" },
            { label: "rpm", link: "/makers/rpm/" },
            { label: "zip", link: "/makers/zip/" },
          ],
        },
        {
          label: "Publishers",
          translations: { "zh-hans": "发布器" },
          items: [
            { label: "appcenter", link: "/publishers/appcenter/" },
            { label: "appstore", link: "/publishers/appstore/" },
            { label: "fir", link: "/publishers/fir/" },
            {
              label: "firebase-hosting",
              link: "/publishers/firebase-hosting/",
            },
            { label: "firebase", link: "/publishers/firebase/" },
            { label: "github", link: "/publishers/github/" },
            { label: "pgyer", link: "/publishers/pgyer/" },
            { label: "qiniu", link: "/publishers/qiniu/" },
            { label: "vercel", link: "/publishers/vercel/" },
          ],
        },
        {
          label: "Tools",
          translations: { "zh-hans": "工具" },
          items: [
            { label: "Parse App Package", link: "/tools/parse-app-package/" },
          ],
        },
      ],
      head: [
        {
          tag: "script",
          attrs: {
            type: "text/partytown",
            src: `https://www.googletagmanager.com/gtag/js?id=${googleAnalyticsId}`,
            async: true,
          },
        },
        {
          tag: "script",
          attrs: {
            type: "text/partytown",
          },
          content: `
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());
              gtag('config', '${googleAnalyticsId}');
            `,
        },
        {
          tag: "script",
          attrs: {
            src: `https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6049036475236211`,
            async: true,
            crossorigin: "anonymous",
          },
        },
      ],
    }),
    tailwind({
      // Disable the default base styles:
      applyBaseStyles: false,
    }),
    partytown({
      // Adds dataLayer.push as a forwarding-event.
      config: {
        forward: ["dataLayer.push"],
      },
    }),
  ],
});
