.class Lcom/android/server/usb/UsbMidiDevice$1;
.super Ljava/lang/Object;
.source "UsbMidiDevice.java"

# interfaces
.implements Landroid/media/midi/MidiDeviceServer$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/usb/UsbMidiDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbMidiDevice;


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbMidiDevice;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClose()V
    .registers 1

    .prologue
    .line 111
    return-void
.end method

.method public onDeviceStatusChanged(Landroid/media/midi/MidiDeviceServer;Landroid/media/midi/MidiDeviceStatus;)V
    .registers 9

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 79
    invoke-virtual {p2}, Landroid/media/midi/MidiDeviceStatus;->getDeviceInfo()Landroid/media/midi/MidiDeviceInfo;

    move-result-object v1

    .line 80
    invoke-virtual {v1}, Landroid/media/midi/MidiDeviceInfo;->getInputPortCount()I

    move-result v3

    .line 81
    invoke-virtual {v1}, Landroid/media/midi/MidiDeviceInfo;->getOutputPortCount()I

    move-result v4

    move v1, v2

    .line 84
    :goto_f
    if-ge v1, v3, :cond_57

    .line 85
    invoke-virtual {p2, v1}, Landroid/media/midi/MidiDeviceStatus;->isInputPortOpen(I)Z

    move-result v5

    if-eqz v5, :cond_3c

    move v1, v0

    .line 91
    :goto_18
    if-nez v1, :cond_55

    .line 92
    :goto_1a
    if-ge v2, v4, :cond_55

    .line 93
    invoke-virtual {p2, v2}, Landroid/media/midi/MidiDeviceStatus;->getOutputPortOpenCount(I)I

    move-result v3

    if-lez v3, :cond_3f

    .line 100
    :goto_22
    iget-object v1, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v1}, Lcom/android/server/usb/UsbMidiDevice;->-get2(Lcom/android/server/usb/UsbMidiDevice;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 101
    if-eqz v0, :cond_42

    :try_start_2b
    iget-object v2, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v2}, Lcom/android/server/usb/UsbMidiDevice;->-get1(Lcom/android/server/usb/UsbMidiDevice;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_42

    .line 102
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-wrap0(Lcom/android/server/usb/UsbMidiDevice;)Z
    :try_end_3a
    .catchall {:try_start_2b .. :try_end_3a} :catchall_52

    :cond_3a
    :goto_3a
    monitor-exit v1

    .line 107
    return-void

    .line 84
    :cond_3c
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 92
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 103
    :cond_42
    if-nez v0, :cond_3a

    :try_start_44
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-get1(Lcom/android/server/usb/UsbMidiDevice;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 104
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$1;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Lcom/android/server/usb/UsbMidiDevice;->-wrap1(Lcom/android/server/usb/UsbMidiDevice;)V
    :try_end_51
    .catchall {:try_start_44 .. :try_end_51} :catchall_52

    goto :goto_3a

    .line 100
    :catchall_52
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_55
    move v0, v1

    goto :goto_22

    :cond_57
    move v1, v2

    goto :goto_18
.end method
