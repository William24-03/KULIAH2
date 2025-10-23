
void main() {
  var skor = 75;
  if (skor >= 85 && skor <= 100) {
    print("skor anda : $skor");
    print("grade anda : A");
  } else if (skor >= 70 && skor <= 84) {
    print("skor anda : $skor");
    print("grade anda : B");
  } else if (skor >= 60 && skor <= 69) {
    print("skor anda : $skor");
    print("grade anda : C");
  } else if (skor >= 50 && skor <= 59) {
    print("skor anda : $skor");
    print("grade anda : D");
  } else if (skor < 50 && skor >= 0) {
    print("skor anda : $skor");
    print("grade anda : E");
  } else {
    print("inputan tidak valid");
  }
}
