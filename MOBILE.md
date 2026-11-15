# OpenCode Android APK

APK-টা শুধু ক্লায়েন্ট (UI)। আসল সার্ভার PC/VPS-এ চলবে, ফোন তার সাথে জোড়া লাগবে।

## APK বানানো
1. এই ফাইলগুলো রিপোজিটরির রুটে রাখো (`.github/workflows/android-apk.yml`, `mobile/`)।
2. GitHub → Actions → "Android APK" → Run workflow।
3. শেষ হলে রান পেজের Artifacts থেকে `opencode-debug-apk` নামিয়ে unzip করো, তারপর `app-debug.apk` ফোনে ইনস্টল করো।

## সার্ভার চালানো (PC-তে)
    opencode serve --hostname 0.0.0.0 --cors https://localhost

তারপর অন্য টার্মিনালে:

    opencode pair --url http://<PC-র-IP>:4096

যে QR/লিংক আসবে সেটা ফোনের অ্যাপে স্ক্যান করো। ফোন আর PC একই Wi-Fi-তে থাকতে হবে।
`--cors https://localhost` না দিলে অ্যাপ সার্ভারে কানেক্ট হবে না।
