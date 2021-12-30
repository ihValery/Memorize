//
//  ThemeData.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

let themeData = [Theme(id: 0, name: "Мультяшки", avatar: "🧚🏼‍♀️", level: 1, timer: 0, age: 3, color: .themeCartoons, number: 4,
                                 collection: ["🧜‍♀️", "🧚‍♀️", "🦄", "🦋", "🐠", "🐬", "🧝‍♀️", "🧞‍♂️", "👼", "🧸", "🎁", "🪄", "🧙🏼", "👑",
                                              "🐣", "🐾", "💐", "🌞", "🐚", "🌈", "🌟", "🌜", "🌸", "🌺", "🌷", "🌼", "🌹", "🧩", "♥️"].shuffled()),
                 Theme(id: 1, name: "Мордочки", avatar: "🐶", level: 2, timer: 0, age: 5, color: .indigoTheme, number: 6,
                                 collection: ["🐨", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐷", "🐯", "🦁", "🐮", "🐸",
                                              "🐵", "🐻‍❄️", "🙈", "🙉", "🙊", "🐤", "🐦", "🐧", "🐔", "🐴", "🐗", "😺", "😻", "😽"].shuffled()),
                 Theme(id: 2, name: "Зоопарк", avatar: "🐘", level: 3, timer: 1, age: 6, color: .pinkTheme, number: 9,
                                 collection: ["🦆", "🦅", "🦉", "🦇", "🐺", "🐝", "🪱", "🐛", "🦋", "🐌", "🐞", "🐜", "🪰", "🦗",
                                              "🦂", "🐢", "🐍", "🦎", "🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐟", "🐳", "🐋", "🦈",
                                              "🦭", "🐊", "🐅", "🐆", "🦓", "🦍", "🦧", "🦣", "🐘", "🦛", "🦏", "🐪", "🐫", "🦒",
                                              "🦘", "🦬", "🐃", "🐂", "🐄", "🐎", "🐖", "🐏", "🐑", "🦙", "🐐", "🦌", "🐕", "🐩",
                                              "🦮", "🐕‍🦺", "🐈", "🐈‍⬛", "🐓", "🦃", "🦜", "🦢", "🦩", "🐇", "🦝", "🦨", "🦡", "🦫",
                                              "🦥", "🐁", "🐿", "🦔"].shuffled()),
                 Theme(id: 3, name: "Хэллоуин", avatar: "🦇", level: 4, timer: 1, age: 7, color: .orangeTheme, number: 9,
                                 collection: ["👻", "🩸", "🕷", "☠️", "🕸", "⚰️", "🧟‍♂️", "🧛🏼", "🎃", "💀", "🦇", "👹", "⛓", "🪦"].shuffled()),
                 Theme(id: 4, name: "Профессии", avatar: "🧑🏽‍🚒", level: 4, timer: 1, age: 8, color: .green, number: 12,
                                 collection: ["👮🏼", "👷🏽", "💂🏻", "🕵🏼", "👩🏻‍⚕️", "👨🏽‍⚕️", "🧑🏾‍🌾", "🧑🏼‍🍳", "🧑🏻‍🎓", "🧑🏼‍🎤", "👩🏻‍🏫", "👨🏽‍🏫", "🧑🏼‍🏭", "🧑🏽‍💻",
                                              "👩🏼‍💼", "👨🏻‍💼", "🧑🏼‍🔧", "👩🏽‍🔬", "👨🏼‍🔬", "👩🏽‍🎨", "👨🏻‍🎨", "🧑🏽‍🚒", "🧑🏼‍✈️", "🧑🏼‍🚀", "👨🏾‍⚖️", "👩🏼‍⚖️", "🤵🏽‍♂️", "🤵🏼‍♀️",
                                              "👩🏼‍🍼", "💇🏽", "💆🏻"].shuffled()),
                 Theme(id: 5, name: "Еда", avatar: "🥑", level: 5, timer: 1, age: 9, color: .tealTheme, number: 12,
                                 collection: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍",
                                              "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥬", "🥒", "🌶", "🫑", "🌽", "🥕", "🧄", "🧅",
                                              "🥔", "🥐", "🥯", "🥖", "🥨", "🧀", "🍳", "🥞", "🥩", "🍗", "🍔", "🍟", "🍕", "🥪",
                                              "🥙", "🌮", "🫔", "🥗", "🍝", "🍣", "🍱", "🥟", "🍚", "🥠", "🍡", "🍨", "🍦", "🥧",
                                              "🍰", "🧁", "🍮", "🍫", "🍩", "🌰", "🧉", "🍹", "🍸"].shuffled()),
                 Theme(id: 6, name: "Смайлики", avatar: "🤪", level: 6, timer: 1, age: 11, color: .redTheme, number: 14,
                                 collection: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃",
                                              "😉", "😌", "🥰", "😘", "😙", "😚", "😋", "😛", "🤪", "🧐", "😎", "🥳", "😒", "😔",
                                              "😕", "🙁", "😖", "🥺", "😤", "😠", "😳", "😨", "🤗", "🤭", "🤫", "🤥", "😬", "🙄",
                                              "😴", "😵‍💫", "🤐", "🤧", "😷", "🤒", "🤕"].shuffled()),
                 Theme(id: 7, name: "Спорт", avatar: "🏓", level: 7, timer: 1, age: 12, color: .greenTheme, number: 16,
                                 collection: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏒", "🏑",
                                              "🏏", "🪃", "🥅", "🏹", "🥊", "🥋", "🛹", "🛼", "⛸", "🥌", "⛷", "🎿", "🏂", "🏋🏼",
                                              "🤼", "🤸🏼", "⛹🏾", "🤺", "🤾🏼", "🏌🏽", "🏇🏼", "🏄🏼", "🏊🏾", "🤽🏽", "🚣🏼", "🧗🏼", "♟", "🎯",
                                              "🎳", "🛶", "⛵️", "🚴🏽"].shuffled()),
                 Theme(id: 8, name: "Рандом", avatar: "🎰", level: 8, timer: 1, age: 14, color: .themeCartoons, number: 20,
                                 collection: ["📌", "✏️", "📧", "🎁", "🧬", "🔫", "🪚", "🧱", "🧲", "💎", "💰", "⏲", "💡", "🧯",
                                              "📱", "⛱", "🚁", "🚲", "🚖", "🎮", "🎨", "🏆", "🏂", "⛷", "⛹🏼", "🏀", "🍾", "🧉",
                                              "🌰", "🍫", "🍤", "🍣", "🍜", "🌯", "🍔", "☄️", "🐚", "🐾", "🦜", "🪰", "🪲", "🕶",
                                              "🩴", "🩳", "👗", "🩱", "👟", "🎓", "🧶", "🥷", "🦷", "👌", "🤖", "🤠"].shuffled()),
                 Theme(id: 9, name: "Флаги", avatar: "🇲🇱", level: 9, timer: 1, age: 16, color: .blueTheme, number: 36,
                                 collection: ["🇦🇺", "🇦🇹", "🇦🇿", "🇦🇽", "🇦🇱", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇩", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇫",
                                              "🇧🇸", "🇧🇭", "🇧🇾", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇬", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🇧🇷", "🇧🇹", "🇻🇺",
                                              "🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇭🇺", "🇻🇪", "🇻🇮", "🇹🇱", "🇻🇳", "🇬🇦", "🇭🇹", "🇬🇾", "🇬🇲", "🇬🇭",
                                              "🇬🇵", "🇬🇳", "🇬🇼", "🇩🇪", "🇩🇴", "🇩🇰", "🇬🇪", "🇮🇱", "🇮🇳", "🇮🇩", "🇾🇪", "🇮🇹", "🇮🇸", "🇮🇪",
                                              "🇮🇷", "🇰🇿", "🇨🇦", "🇨🇾", "🇨🇬", "🇱🇺", "🇲🇷", "🇲🇱", "🇳🇱", "🇳🇬", "🇳🇴", "🇳🇫", "🇰🇷", "🇷🇺",
                                              "🇸🇽", "🇹🇷", "🇺🇦", "🇵🇭", "🇫🇮", "🇨🇿", "🇸🇪", "🇯🇵", "🇯🇲", "🇪🇪", "🇿🇦"].shuffled()),
                 Theme(id: 10, name: "Символы", avatar: "♑︎", level: 10, timer: 1, age: 18, color: .grayTheme, number: 36,
                                 collection: ["℔", "℥", "ℨ", "µ", "Ω", "ℑ", "℞", "⚓︎", "♨︎", "♈︎", "♉︎", "♊︎", "♋︎", "♌︎", "♍︎", "♎︎", "♏︎",
                                              "♐︎", "♑︎", "♒︎", "♓︎", "☉", "☿", "♀︎", "♁", "♂︎", "♃", "♄", "♅", "⛢", "♆", "♇", "☄︎", "⚲",
                                              "⚢", "⚣", "⚤", "⚦", "⚨", "⚩", "☊", "☋", "☌", "☩", "⚕︎", "⚖︎", "☘︎", "☭", "☪︎", "☮︎", "☯︎",
                                              "☸︎", "❦", "❡", "⌘", "⎃", "⌇", "⌭", "⌰", "⍥", "⍦", "⍧", "⍨", "⍩", "⍵", "⍶", "⍷", "⍻",
                                              "⍼", "⍬", "〄"].shuffled())]
