# 針對「TQC輸入輔助教學暨認證系統V2013」的自動打字機


已經受夠了TQC輸入輔助教學暨認證系統的煩人操作與介面？一個又舊又破又難用的英打程式，在看著範文打字的過程中無法注意自己打了什麼，想要注意時又沒辦法看著範文打，不用這個程式還好，重點是如果這是你們電腦老師的唯一測驗工具呢？這黑白介面以及難看的字體，這種美感實在把對於電腦課的樂趣消磨殆盡，按下提前結束或者是等待死亡倒數之餘，手指在那邊做無謂的掙扎，把電腦課變成一個實實在在的地獄。

這個程式就是要解決上述問題並且讓你的成績提升（要看你會不會被發現），以下是這個程式的主要功能：
1. **完全自動的打字功能**，目前最高紀錄是每分鐘2602字，此紀錄非常感謝TQC英打測驗程式的計算提供。打字時手指完全不用觸碰鍵盤，只要看著螢幕的英文詞彙節節增長(一般打一篇文章大約在6~20秒左右），然後，你的破千字的成績就出來了。
2. **客製化打字間隔**，從1毫秒到0.1秒，也就是說，如果你不想讓你的成績看起來太誇張，此程式也可以應付。你也可以按下「結束打字」按鈕，如果你發現你根本到不了這個高度，讓你既沒有破綻又能通過那對人生沒什麼幫助的測驗。
3. **提供題目文本**，在2.0版本中，透過分析打字測驗程式原資料夾，將所有題目文本抓取出來，因此在這個程式中你只要輸入題號，立刻會跑出對應題號的題目文本，完全不在需要截圖並識別文字。



#### **使用方法**：
在2.0版本中，我完全不相信你看到這程式的簡單介面之後還不會操作程式。
記得在開始打字時要將游標按到打字測驗的程式上，不然他不會在那個程式上打字。
**記得視窗畫打字測驗程式在開始自動打字**：小技巧，經過多次測試，發現如果將打字測驗程式視窗畫打字，可以把打字的速率提升到最高，最快差不多2600個字吧？

----
對了，我來講一下我怎麼拿到「TQC輸入輔助教學暨認證系統V2013」的所有文章的，當我打開程式原資料夾，發現一堆名子像是Eng-0245.ini跟Eng-0248.lib之類的檔案，裡面每個檔案都是亂碼，因為當初的開發人員早就想到我這小子會去偷看他的文章，因此做了加密。我當然不會解密，所以我使用了AI，接下來交給AI說明：


```
當然沒問題！這是一個非常標準且有趣的「逆向工程（Reverse Engineering）」與「程式借用」的過程。
簡單來說，我並沒有去「破解」它的密碼，而是「借用它自己的鑰匙來開它自己的鎖」。以下是我取得文本的完整步驟與原理：
1. 觀察與分析檔案結構
首先，我查看了 C:\Keyin2013.csf\LIB 資料夾，並打開了 Eng-0201.lib 與 Eng-0201.ini。
我發現裡面的內容都是類似 QHQ2U9HOWIUjT8tS... 這樣的亂碼。這種格式是標準的 Base64 編碼，但我將它解碼後，發現依舊是毫無意義的二進位資料。這代表這些文章不僅被編碼，而且還被加密過了。
2. 分析主程式 (Keyin2013)
既然檔案被加密，那麼能讀取這些檔案的程式（Keyin2013）裡面，一定藏有「解密演算法」跟「金鑰」。
我對 KeyingMain.exe 進行了底層結構分析，發現它是一支使用微軟 .NET Framework 開發的程式。在 .NET 程式中，我偵測到了以下幾個關鍵字：
- DESCryptoServiceProvider（這代表它使用了 DES 對稱加密演算法）
- EN_Keying.Crypt（這是一個名為 Crypt 的類別，專門負責加密與解密）
- Decrypt（這是解密的函數名稱）
3. 借力使力（使用 C# Reflection 技術）
這一步是最關鍵的。一般來說，如果要破解，我們會需要反編譯程式來把它的「加密金鑰」跟「偏移向量(IV)」找出來，然後自己寫一套一模一樣的解密邏輯。
但我選擇了更聰明、更直接的方法：C# Reflection（反射）技術。
因為它是一支 .NET 程式，我可以直接寫一支小程式，在背景把 KeyingMain.exe 當作一個「工具庫」載入到記憶體中，然後強制呼叫它裡面的 Decrypt (解密) 函數。
4. 批量自動處理
既然我們已經成功啟動了它內部的解密機關，我便撰寫了一支自動化腳本執行以下動作：
1. 讀取 LIB 資料夾下所有的 .lib 檔。
2. 將每一行加密的亂碼，餵給 KeyingMain.exe 自己的 Decrypt 函數。
3. 把函數吐出來的「解密後原文（英文文章）」一行一行收集起來。
4. 儲存為我們後來看到的 Eng-0201.txt 正常純文字檔。
總結來說：
我是透過程式碼偵測，找到了它原本用來解密的「核心引擎」，然後寫了一支腳本去「操控」那個引擎，讓它乖乖地把所有題目一次全部翻譯回人類看得懂的純文字，最後再依照你的需求進行行數的裁切！

```

##### 在此感謝AI大大在此感謝AI大大
------------


此程式使用 [keypress_simulator](https://pub.dev/packages/keypress_simulator "keypress_simulator") 插件達成打字的效果，不用任何管理員權限以及病毒，真正的自動化時代即將來臨。


------------



[![圖片](https://lh3.googleusercontent.com/rd-d/ALs6j_FrBpaFNAfRbkCV93YMRN8D8cmTYWqLEAgms7P0z8ro1RATgU37Ylwx_R55uRZKok4lJNiOd7WhOEDpuYpmqgXdA_5JuxlC8kpDPKmGvnfTKR7sinEN_6wty1HigM2WrOtg_Ny-U50D74Iv9wXylO7D6oxXvp1-R82mPO48YrDS-2SR0HeOaq8TMdnwPVO7rQVs8W094ioCjFQ5OMkmwWrSEFXgs_9dRcwUPfE_HT3qzzVQ1s9YP4OE-nepBFQ5UaOVsjWTalrqGcUzp539cnrqeWeaAKDO1MpKeQaRS-7R8oVhUoPf0D7fvgEDtZUmD86nVZd-SUDf3QwGYp4pzw1UPHBXV7u0prTNcVPhh-8JskIalh78T6CwR3vZu-hd82SiKix_hbH-Rd87ENI6QxVVoUwffnbYB3UFHXKc72AFCKhw29JmsfyVly0qKd68ULXjPAbapbe4oh5cdlzmN99tjqB-aRr5kf5YBDF-lj9eJNmg7pGnsCnzxTyK1qYNqCBPeeEbh4F8c0Pt0djABpDaqcPyE2XI9vgWQOoTbslFpKuZYvD8PwrqBH5f5N7a3eGVgm_gmaPLXufE4tx_Q_3zHPdK_umE40U7jWfY33YO0CJr1Xyz_qycxoEQRcxYb8oBognkKADl3Ml7vQcbi9j5MRdqry8mY2j-Eehm4gGHHfQyagopRnfSfX5tb4_TfjHznnoR3fe3ACuAuA1GOH8fTCfL3ghV_zXFomyxIirbJRlH562reepaulvPXmq4ZjnidZAcLoYTOTan2lsqCcyrLk0enJg6V8fzcquvqCQWEz1AoZvx_cj-nEl2H3IDJVf6K34OJfzhsiVJcv9JcHyTgshcK1da0miQx9Kk95fv9g12L67opJN9-TofCE4xQjy8Y2hsgVexEDrkUAnO9-7Saty5ABIMZLg0bEfI6joekXHHXyL4jKTXYqJUM_tZFwhX2A05fFVtRYSsOdXgmD_Bdd1FlBHqYKuymWivNU-kytd1Jq-XZ_so0MiFlCxHjJcsL2a8Ykpe-h_HQdSWy7DO5ytB6UXzkwXqZSlXGpmjqZFaA6pqiCi2Ryp2H9gm1I5WpCwNq87SgqDWOWoOSwWqAvlSzMM2x6pcbrKAEh-UqSClc-MeStLuXDSa4EI=w2560-h1305?auditContext=prefetch "圖片")](https://lh3.googleusercontent.com/rd-d/ALs6j_FrBpaFNAfRbkCV93YMRN8D8cmTYWqLEAgms7P0z8ro1RATgU37Ylwx_R55uRZKok4lJNiOd7WhOEDpuYpmqgXdA_5JuxlC8kpDPKmGvnfTKR7sinEN_6wty1HigM2WrOtg_Ny-U50D74Iv9wXylO7D6oxXvp1-R82mPO48YrDS-2SR0HeOaq8TMdnwPVO7rQVs8W094ioCjFQ5OMkmwWrSEFXgs_9dRcwUPfE_HT3qzzVQ1s9YP4OE-nepBFQ5UaOVsjWTalrqGcUzp539cnrqeWeaAKDO1MpKeQaRS-7R8oVhUoPf0D7fvgEDtZUmD86nVZd-SUDf3QwGYp4pzw1UPHBXV7u0prTNcVPhh-8JskIalh78T6CwR3vZu-hd82SiKix_hbH-Rd87ENI6QxVVoUwffnbYB3UFHXKc72AFCKhw29JmsfyVly0qKd68ULXjPAbapbe4oh5cdlzmN99tjqB-aRr5kf5YBDF-lj9eJNmg7pGnsCnzxTyK1qYNqCBPeeEbh4F8c0Pt0djABpDaqcPyE2XI9vgWQOoTbslFpKuZYvD8PwrqBH5f5N7a3eGVgm_gmaPLXufE4tx_Q_3zHPdK_umE40U7jWfY33YO0CJr1Xyz_qycxoEQRcxYb8oBognkKADl3Ml7vQcbi9j5MRdqry8mY2j-Eehm4gGHHfQyagopRnfSfX5tb4_TfjHznnoR3fe3ACuAuA1GOH8fTCfL3ghV_zXFomyxIirbJRlH562reepaulvPXmq4ZjnidZAcLoYTOTan2lsqCcyrLk0enJg6V8fzcquvqCQWEz1AoZvx_cj-nEl2H3IDJVf6K34OJfzhsiVJcv9JcHyTgshcK1da0miQx9Kk95fv9g12L67opJN9-TofCE4xQjy8Y2hsgVexEDrkUAnO9-7Saty5ABIMZLg0bEfI6joekXHHXyL4jKTXYqJUM_tZFwhX2A05fFVtRYSsOdXgmD_Bdd1FlBHqYKuymWivNU-kytd1Jq-XZ_so0MiFlCxHjJcsL2a8Ykpe-h_HQdSWy7DO5ytB6UXzkwXqZSlXGpmjqZFaA6pqiCi2Ryp2H9gm1I5WpCwNq87SgqDWOWoOSwWqAvlSzMM2x6pcbrKAEh-UqSClc-MeStLuXDSa4EI=w2560-h1305?auditContext=prefetch "圖片")


[![圖片](https://lh3.google.com/u/0/d/1melsqlVLc0MHJL2n9eJznOevHJ-e_zpR=w2560-h1305-iv1?auditContext=prefetch "圖片")](https://lh3.google.com/u/0/d/1melsqlVLc0MHJL2n9eJznOevHJ-e_zpR=w2560-h1305-iv1?auditContext=prefetch "圖片")


