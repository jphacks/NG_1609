# Tourhythm
## Client : 
[![Xcode](https://img.shields.io/badge/Xcode-8.0.1-blue.svg)](https://developer.apple.com/xcode/)
[![Swift](https://img.shields.io/badge/Swift-3.0.1-orange.svg)](https://swift.org/)
[![Support](https://img.shields.io/badge/support-iOS%209%2B%20-orange.svg?style=flat)](https://www.apple.com/nl/ios/)
[![Homebrew](https://img.shields.io/badge/Homebrew-1.0.5-yellow.svg)](http://brew.sh/index_ja.html)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-1.1.1-red.svg)](https://cocoapods.org)
[![SwiftLint](https://img.shields.io/badge/SwiftLint-0.11.1-blue.svg)](https://github.com/realm/SwiftLint)
[![Carthage](https://img.shields.io/badge/Carthage-0.18.1-blue.svg)](https://github.com/Carthage/Carthage)

## Server : https://github.com/jphacks/NG_1609_2 
![Ruby](https://img.shields.io/badge/Ruby-2.3.1-red.svg)
![Rails](https://img.shields.io/badge/Rails-5.0.0.1-red.svg)

## Resources :  https://github.com/jphacks/NG_1609_3 
![XD](https://img.shields.io/badge/XD-0.6.2.7-ff69b4.svg)

## 製品概要
### Tourism X Technology
**旅行をもっと楽しく、面白く、効率的に**  
東京オリンピックが2020年に開催され、日本での「**観光**」に注目が集まっています。
より良い日本での観光を提供したいと考え、「**観光**」 を 「**テクノロジー**」　を使って改善してみました！

### 背景（製品開発のきっかけ、課題等）
* 外国人観光客の増加が見込まれている
* 東京オリンピック2020での観光客を見据えたサービスを提供する必要がある
* 日本が観光立国を目指して、観光ビジョン実現プログラムなどを進めている

### 製品説明（具体的な製品の説明）
### 特長
####1. 行きたい場所への適切なルート検索ができる
 * 買い物などの時間コストを考慮できる
 * おすすめスポット等のレコメンデーションをしてもらえる
  
####2. 不足している通訳者の代わりになることができる 
 * 情報を多言語で表示できる
  
####3. 旅行プランをダウンロードでき、SNS等でシェアできる
  * プランを画像として、保存できる
  
### 解決出来ること
* 圧倒的に不足している通訳者の代わりに使うことができる
* 時間を考慮した旅行プランを立てることができる
* 作ったプランを簡単にシェアできる
 

### 今後の展望
* 世界中での旅行に活用できる　
 * 日本人が海外に行っても使える
* 旅行に利用するチケットなども一緒に購入できる

### 注力したこと（こだわり等）
* 行きたいリストから時間考慮した旅行プランをGoogleMapAPIを使って実装したこと
* 行き先評価エンジンの開発
 * 選んでいる傾向、GPS座標からおすすめのスポットを紹介してもらえる

## 開発技術
* Xcode　8.0.1
* Swift　3.0.1
* Rails　5.0.0.1
* Ruby　2.3.1

### 活用した外部技術
#### API・データ
* [Google Maps Directions API](https://www.microsoft.com/ja-jp/translator/translatorapi.aspx)
* [Microsoft Translator Text API] (https://www.microsoft.com/ja-jp/translator/translatorapi.aspx)

#### フレームワーク・ライブラリ・モジュール
* CocoaPods
* Carthage

### 独自技術
#### 期間中に開発した独自機能・技術
* 時間コストを考慮した旅行プラン生成機能（GoogleMapAPI）
* 行き先評価エンジン（Gooキーワード解析APIを利用したレコメンデーション）


