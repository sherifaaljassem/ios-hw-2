import UIKit
/*:
 # الواجب الثالث: لعبة UNO
 
 تحتوي لعبة الأونو على ٤ ألوان و١٠ أرقام.
 - تتكرر الأرقام لكل لون مرتين. ماعدا الرقم صفر، يتواجد مرة واحدة للون الواحد.
- توجد هناك ورقتين Action Cards لكل لون.
 1. Draw
 2. Reverse
 3. Pass

*/


//: ![Uno Deck](deck.jpg)


/*:
 ### المطلوب:
#### الجزء الأول:
 -- قم بإنشاء struct باسم Card به  الصفات التالية
 * color: String
 * number: Int
 
 -- قم بإنشاء مصفوفة من نوع `Card` فارغة، ثم قم بملئها بالأرقام فقط مرة واحدة من دون ال action cards ومن دون تكرار كل رقم مرتين (تكرار الأرقام بونص 🎁)
 
 - Green: 0 -> 9
 - Red: 0 -> 9
 - Blue: 0 -> 9
 - Yellow: 0 -> 9
 
 #### الجزء الثاني:
-- قم بإنشاء دالة بداخل الستركت Card باسم  `imageName`والتي تقوم بإرجاع اسم الصورة للكرت. قم بفتح المجلد Resources الموجود بداخل الplayground من النافذة اليسرى لرؤية طريقة تسمية الكرت
 ###### مثال على تسمية الكروت موضحة كالتالي، قم بتشغيل الكود لرؤية الصور أسفل هذه الأكواد:
 */





]
var blue_5 = UIImage(named: "Blue_6.png")
var red_9 = UIImage(named: "Red_9.png")

var green_Skip = UIImage(named: "Green_Skip.png")
var wild_Draw = UIImage(named: "Wild_Draw.png")
let cardImages = cards.map{UIImage(named: $0.imageName())}
randomCardImage


/*:
 
 
 ### الجزء الثالث (تجريب الكود😍):
 قم بإزالة الملاحظة عن الأسطر الأخيرة لتجربة الكود إن كان يعمل بشكل مناسب،
 الجزء الأول سيظهر كرت عشوائي
 الجزء الثاني سيظهر مجموعة الكروت كاملة 🃏🎴
 ```
 let randomCard = cards.randomElement()!
 let randomCardImage = UIImage(named: randomCard.imageName())
```

 ```
 let cardImages = cards.map{UIImage(named: $0.imageName())}
 randomCardImage
 ```
 إن تم ذلك بالشكل الصحيح من دون أي خطأ، فقد نجحت في المهمة! 🎉
 
  #### الجزء الرابع (بونص 🎁):
 -- قم بتعبئة مجموعة الكروت كل رقم يعرض مرتين، إلا الصفر، يعرض مرة واحدة، كما هو موضح في صورة مجموعة الأونو في بداية الملف
 -- قم باستعمال For Loop لتعبئة جميع الكروت

 
 #### الجزء الخامس (إكسترا إكسترا بونص 🌶🔥)
 -- قم بتعبئة المصفوفة أيضاً ب Action Cards من خلال تحويلك للصفات إلى optional بإضافة علامة الاستفهام إليها
اسم ال Action Cards موضح في الصور بداخل ال Resources
 
 ```
 var color: String?
 var action: String?
 var number: Int?
 ```
  لا تنسى إزالة كلمة  Optional بسبب تحويلك للمتغيرات إلى متغيرات بعلامة الاستفهام. ربما ستضطر إلى كتابة بعض أوامر if
  
 */


//: ---

//: # الحل ...
struct Card{
    var color: String?
    var number: Int?
    var actionCards: String?
    func imageName() -> String{
        if number != nil{
            print("\(color!))_\(number!)")
            return "\(color!)_\(number!)"
    }
        else if actionCards! == "Wild" || actionCards! == "Wild_Draw"{
            print("\(actionCards!)")
            return "\(color!)_\(number!)"
        }else{
            print("\(color!)_\(actionCards!)")
            return "\(color!)_\(actionCards!)"
        }
    }
}
var cards = [Card] = []
let colors = ["Blue", "Green", "Red", "Yellow"]
let actionCards = ["Reverse", "Draw", "Skip", "Wild", "Wild_Draw"]
for color in colors{
    cards.append(Card(color:color, number:0))
    for i in 1...2{
        for action in actionCards{
            if i == 1 && action !== "Wild_Draw"{
                cards.append(Card(color: color, actionCards: action))
            }
        }
        else if i == 2 && action != "Wild"{
            cards.append(Card(color: color, actionCards: action))
        }
    }
    for c in 1...9{
        cards.append(Card(color: color, number: c))
    }
}

