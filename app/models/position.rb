class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: 'より' },
    { id: 3, name: 'ちゅう' },
    { id: 4, name: 'ひき' },
    { id: 5, name: '座り' }
  ]
end