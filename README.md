# Tourhythm
## Client
[![Xcode](https://img.shields.io/badge/Xcode-8.0.1-orange.svg)](https://developer.apple.com/xcode/)
[![Swift](https://img.shields.io/badge/Swift-3.0.1-orange.svg)](https://swift.org/)
[![Support](https://img.shields.io/badge/support-iOS%209%2B%20-orange.svg?style=flat)](https://www.apple.com/nl/ios/)
[![Homebrew](https://img.shields.io/badge/Homebrew-1.0.5-orange.svg)](http://brew.sh/index_ja.html)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-1.1.1-orange.svg)](https://cocoapods.org)
[![SwiftLint](https://img.shields.io/badge/SwiftLint-0.11.1-orange.svg)](https://github.com/realm/SwiftLint)
[![Carthage](https://img.shields.io/badge/Carthage-0.18.1-orange.svg)](https://github.com/Carthage/Carthage)

## Server : https://github.com/jphacks/NG_1609_2 
![Ruby](https://img.shields.io/badge/Ruby-2.3.1-orange.svg)
![Rails](https://img.shields.io/badge/Rails-5.0.0.1-orange.svg)

## 製品概要
### TourTech　(Tourism X Technology)
**旅行をもっと楽しく、面白く、効率的に** 
東京オリンピックが２０２０年に開催され、日本での「　**観光**　」に注目が集まっています。
より良い日本での観光を提供したいと考え、「　**観光**　」 を 「　**テクノロジー**　」　を使って改善してみました！

### 背景（製品開発のきっかけ、課題等）
* 外国人観光客の増加
* オリンピック2020での観光客を見据えたサービスを提供する必要がある
* 日本が観光立国を目指して、観光ビジョン実現プログラムなどを進めている

### 製品説明（具体的な製品の説明）
### 特長
####1. 行きたい場所へのルート検索ができる
  * 多言語で使うことができる
  * 買い物などの時間コストを考慮できる
  
####2. 行き先のレコメンデーションをしてもらえる
  * 混雑していない場所
  * 近場のおすすめスポット
  
####3. 旅行プランをダウンロードでき、SNS等でシェアできる
  * プランを画像として、保存できる
  
### 解決出来ること
* 時間を考慮した旅行プランを立てることができる
* 旅行をより楽しく、より効率的に

### 今後の展望
* 世界中での旅行に活用できる　
 * 日本人が海外に行っても使える


### 注力したこと（こだわり等）
* 行きたいリストから時間考慮した旅行プランを立てることができる
  *　細かな実用的なプラン立てができる
* 行き先評価エンジンの開発

## 開発技術
* Xcode　8.0.1
* Swift　3.0.1
* Rails 5.0.0.1
* Ruby　2.3.1

### 活用した外部技術
#### API・データ
* http://kyoto.konderu.com/
* GoogleMapAPI

#### フレームワーク・ライブラリ・モジュール
* CocoaPods
* Carthage

### 独自技術
#### 期間中に開発した独自機能・技術
* 行き先評価エンジン（複数のパラメータでのレコメンデーション）
* 混雑状況評価エンジン（Twitterの形態素解析による http://kyoto.konderu.com/ 　のような機能の実装）

 

