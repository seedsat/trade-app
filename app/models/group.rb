class Group < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '乃木坂46' },
    { id: 3, name: '櫻坂46' },
    { id: 4, name: '日向坂46' }
  ]
end