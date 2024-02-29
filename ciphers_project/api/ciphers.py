def caesar_encode(plain_text, shift):
    cipher_text = ""
    for char in plain_text:
        if 32 <= ord(char) <= 126:
            shifted_code = ord(char) + shift
            if shifted_code > 126:
                shifted_code = 32 + (shifted_code - 127)
            elif shifted_code < 32:
                shifted_code = 127 - (32 - shifted_code)
            cipher_text += chr(shifted_code)
        else:
            cipher_text += char
    return cipher_text