using MD5
data = "ugkcyxxp"
out = Array{Union{Char, Nothing}}(nothing, 8)
#out[5] = '3'
#out[3] = 'c'
#out[2] = '3'
#out[6] = '0'
#out[8] = '5'
left = 8
i = 0
while i < 1e11
    s = data * string(i)
    global i += 1
    hash = bytes2hex(md5(s))
    if hash[1:5] == "00000"
        ind = Int(hash[6]) - 47
        if (ind >= 1) & (ind <= 8)
            if out[ind] != nothing
                continue
            end
            println("$ind: $(hash[7]) from number $i ")
            out[ind] = hash[7]
            global left -= 1
            if left <= 0
                break
            end
        end
    end
end
join(out)