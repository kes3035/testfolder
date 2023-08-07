import UIKit

//: ## 2023/08/07 Today I Learned

var string = "Hello, Swift🥰"

for uint32 in string.unicodeScalars {
    print(uint32.value)
}

/* 출력된 값
 72             -> H
 101            -> e
 108            -> l
 108             .
 111             .
 44              .
 32              .
 83
 119
 105
 102
 116
 129392         -> 🥰
 */

// "\u{값}" 을 통해 직접적 문자 표현도 가능

print(string.utf8)
print(string.utf16)
print(string.utf8CString)


// 스위프트에서는 어떤 글자의 count를 할 때 다른 유니코드를 조합해도 조합된 결과가 같으면 하나의 문자로 보기 때문에
// 카운트가 똑같다는 것을 주의하자.
