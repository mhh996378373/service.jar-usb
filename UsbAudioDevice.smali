.class public final Lcom/android/server/usb/UsbAudioDevice;
.super Ljava/lang/Object;
.source "UsbAudioDevice.java"


# static fields
.field protected static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "UsbAudioDevice"

.field public static final kAudioDeviceClassMask:I = 0xffffff

.field public static final kAudioDeviceClass_External:I = 0x2

.field public static final kAudioDeviceClass_Internal:I = 0x1

.field public static final kAudioDeviceClass_Undefined:I = 0x0

.field public static final kAudioDeviceMetaMask:I = -0x1000000

.field public static final kAudioDeviceMeta_Alsa:I = -0x80000000


# instance fields
.field public final mCard:I

.field public final mDevice:I

.field public final mDeviceClass:I

.field private mDeviceDescription:Ljava/lang/String;

.field private mDeviceName:Ljava/lang/String;

.field public final mHasCapture:Z

.field public final mHasPlayback:Z


# direct methods
.method public constructor <init>(IIZZI)V
    .registers 7

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceName:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceDescription:Ljava/lang/String;

    .line 44
    iput p1, p0, Lcom/android/server/usb/UsbAudioDevice;->mCard:I

    .line 45
    iput p2, p0, Lcom/android/server/usb/UsbAudioDevice;->mDevice:I

    .line 46
    iput-boolean p3, p0, Lcom/android/server/usb/UsbAudioDevice;->mHasPlayback:Z

    .line 47
    iput-boolean p4, p0, Lcom/android/server/usb/UsbAudioDevice;->mHasCapture:Z

    .line 48
    iput p5, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceClass:I

    .line 49
    return-void
.end method


# virtual methods
.method getDeviceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceName:Ljava/lang/String;

    return-object v0
.end method

.method setDeviceNameAndDescription(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 72
    iput-object p1, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceName:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceDescription:Ljava/lang/String;

    .line 74
    return-void
.end method

.method toShortString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[card:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/usb/UsbAudioDevice;->mCard:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " device:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/usb/UsbAudioDevice;->mDevice:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    const-string/jumbo v1, "UsbAudioDevice: [card: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mCard:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    const-string/jumbo v1, ", device: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mDevice:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    const-string/jumbo v1, ", name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    const-string/jumbo v1, ", hasPlayback: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mHasPlayback:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    const-string/jumbo v1, ", hasCapture: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mHasCapture:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    const-string/jumbo v1, ", class: 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/usb/UsbAudioDevice;->mDeviceClass:I

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
