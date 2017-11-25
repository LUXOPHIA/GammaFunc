# GammaFunc
[ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)の計算方法。

![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)

ガンマ関数`Γ(x)`は以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/d40bd2656c5d261718de71dc3c623e3669bcc480)  
> \* [Gamma function](https://en.wikipedia.org/wiki/Gamma_function)：[Wikipedia](https://en.wikipedia.org)

ここでは扱わないが、複素数への拡張も可能である。

> ![](http://mathworld.wolfram.com/images/interactive/GammaReImAbs.gif)  
> \* [Gamma Function](http://mathworld.wolfram.com/GammaFunction.html)：[Wolfram MathWorld](http://mathworld.wolfram.com)

数値計算によって求める手法には以下の３つが存在するが、ここでは最も一般的な Lanczos近似 を用いる。
* [Stirling's approximation](https://ja.wikipedia.org/wiki/スターリングの近似)
* [Spouge's approximation](https://en.wikipedia.org/wiki/Spouge%27s_approximation)
* [Lanczos approximation](https://en.wikipedia.org/wiki/Lanczos_approximation)

Lanczos近似 は以下のように、適切な定数`g`に依存する係数列`pk(g)`によって定義され、数列の個数`N`が多いほど高精度な近似が可能となる。ここでは`N = 7, 9, 11, 15`の場合を実装し、対応する`g`はそれぞれ`g = 5, 7, 9, 607/128`となる。 

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/d69a2c80753172cbeac791e9a2b087ff58ba7d84)  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/63215a71cb9d0058b928f302856859a89045acd2)  
> \* [Lanczos approximation](https://en.wikipedia.org/wiki/Lanczos_approximation)：[Wikipedia](https://en.wikipedia.org)

ガンマ関数は、発散する特異点を含まない正の定義域においても非常に大きな値となるので、[倍精度浮動小数点数](https://ja.wikipedia.org/wiki/倍精度浮動小数点数)（Double型）で計算したとしても、**`約172.6 < x`** の定義域においてオーバーフローが避けられない。


そこで、ガンマ関数を利用する諸計算には、ガンマ関数の対数である [**対数ガンマ関数（log-gamma function）**](https://en.wikipedia.org/wiki/Gamma_function#The_log-gamma_function)を間接的に利用した方が扱いやすい。

> ![](http://mathworld.wolfram.com/images/interactive/LogGammaReImAbs.gif)  
> \* [Log Gamma Function](http://mathworld.wolfram.com/LogGammaFunction.html)：[Wolfram MathWorld](http://mathworld.wolfram.com)

なお、対数ガンマ関数`Ln(Γ(x))` は ガンマ関数`Γ(x)` が正となる定義域でしか定義されないので、対数ガンマ関数からガンマ関数を逆算する際には [**オイラーの相半公式（reflection formula）**](https://ja.wikipedia.org/wiki/ガンマ関数#.E7.9B.B8.E5.8D.8A.E5.85.AC.E5.BC.8F)を利用する必要がある。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/6cc677d086fe3a8fe0c5eb3d5bca460565de56b5)  
> \* [Lanczos approximation](https://en.wikipedia.org/wiki/Lanczos_approximation)：[Wikipedia](https://en.wikipedia.org)

ここでは、２種類の実装方法を提供する。

* `LUX.Math.Special.Gamma.Lanczos`.pas  
    Lanczos近似に忠実な実装。
    * `function LnGammaP*( const X_:Double ) :Double;`  
        > 正の定義域のみの対数ガンマ関数。
    * `function LnGamma*( const X_:Double ) :Double;`
        > 対数ガンマ関数（負の値域は未定義）。
    * `function GammaP*( const X_:Double ) :Double;`
        > 正の定義域のみのガンマ関数（対数ガンマ関数から逆算）。
    * `function Gamma*( const X_:Double ) :Double;`
        > ガンマ関数（対数ガンマ関数から逆算）。
* `LUX.Math.Special.Gamma.Ooura`.pas  
    [大浦拓哉](http://www.kurims.kyoto-u.ac.jp/~ooura/profile-j.html)氏による最適化実装。
    * `function dgamma( const X_:Double ) :Double;`  
        > 直接計算型のガンマ関数。
    * `function LnGammaP( const X_:Double ) :Double;`  
        > 正の定義域のみの対数ガンマ関数。
    * `function LnGamma( const X_:Double ) :Double;`  
        > 対数ガンマ関数（負の値域は未定義）。
    * `function GammaP( const X_:Double ) :Double;`
        > 正の定義域のみのガンマ関数（対数ガンマ関数から逆算）。
    * `function Gamma( const X_:Double ) :Double;`
        > ガンマ関数（対数ガンマ関数から逆算）。

----

* [京都大学](http://www.kyoto-u.ac.jp/ja)
    * [京都大学数理解析研究所](http://www.kurims.kyoto-u.ac.jp/ja/index.html)
        * [Ooura's Mathematical Software Packages](http://www.kurims.kyoto-u.ac.jp/~ooura/index-j.html)
            * [Gamma / Error Functions](http://www.kurims.kyoto-u.ac.jp/~ooura/gamerf-j.html)

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
