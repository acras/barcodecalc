# encoding: UTF-8

class BarcodeI25
  def initialize(code = nil)
    @code = code
  end
  
  def generate
    r = [:nb, :ns, :nb, :ns]
    pos = 0
    chars = @code.to_s.split('')
    1.upto(chars.size / 2) do |i|
      c1 = _e(chars[i*2-2], 'b')
      c2 = _e(chars[i*2-1], 's')
      0.upto(4) do |j|
        r << c1[j] << c2[j]
      end
    end
    r + [:wb, :ns, :nb]
  end
  
  private
    def _e(c, l)
      n = "n#{l}".to_sym
      w = "w#{l}".to_sym
      res = case c.to_i
              when 0 then [n,n,w,w,n]
              when 1 then [w,n,n,n,w]
              when 2 then [n,w,n,n,w]
              when 3 then [w,w,n,n,n]
              when 4 then [n,n,w,n,w]
              when 5 then [w,n,w,n,n]
              when 6 then [n,w,w,n,n]
              when 7 then [n,n,n,w,w]
              when 8 then [w,n,n,w,n]
              when 9 then [n,w,n,w,n]
            end
      res
    end
end
