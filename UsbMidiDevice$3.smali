.class Lcom/android/server/usb/UsbMidiDevice$3;
.super Ljava/lang/Thread;
.source "UsbMidiDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/usb/UsbMidiDevice;->openLocked()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/usb/UsbMidiDevice;

.field final synthetic val$eventSchedulerF:Lcom/android/internal/midi/MidiEventScheduler;

.field final synthetic val$outputStreamF:Ljava/io/FileOutputStream;

.field final synthetic val$portF:I


# direct methods
.method constructor <init>(Lcom/android/server/usb/UsbMidiDevice;Ljava/lang/String;Lcom/android/internal/midi/MidiEventScheduler;Ljava/io/FileOutputStream;I)V
    .registers 6

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/server/usb/UsbMidiDevice$3;->this$0:Lcom/android/server/usb/UsbMidiDevice;

    iput-object p3, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$eventSchedulerF:Lcom/android/internal/midi/MidiEventScheduler;

    iput-object p4, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$outputStreamF:Ljava/io/FileOutputStream;

    iput p5, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$portF:I

    .line 258
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 264
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$eventSchedulerF:Lcom/android/internal/midi/MidiEventScheduler;

    invoke-virtual {v0}, Lcom/android/internal/midi/MidiEventScheduler;->waitNextEvent()Lcom/android/internal/midi/EventScheduler$SchedulableEvent;

    move-result-object v0

    check-cast v0, Lcom/android/internal/midi/MidiEventScheduler$MidiEvent;
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_8} :catch_42

    .line 269
    if-nez v0, :cond_14

    .line 279
    const-string/jumbo v0, "UsbMidiDevice"

    const-string/jumbo v1, "output thread exit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    return-void

    .line 273
    :cond_14
    :try_start_14
    iget-object v1, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$outputStreamF:Ljava/io/FileOutputStream;

    iget-object v2, v0, Lcom/android/internal/midi/MidiEventScheduler$MidiEvent;->data:[B

    iget v3, v0, Lcom/android/internal/midi/MidiEventScheduler$MidiEvent;->count:I

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_1e} :catch_24

    .line 277
    :goto_1e
    iget-object v1, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$eventSchedulerF:Lcom/android/internal/midi/MidiEventScheduler;

    invoke-virtual {v1, v0}, Lcom/android/internal/midi/MidiEventScheduler;->addEventToPool(Lcom/android/internal/midi/EventScheduler$SchedulableEvent;)V

    goto :goto_0

    .line 274
    :catch_24
    move-exception v1

    .line 275
    const-string/jumbo v1, "UsbMidiDevice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "write failed for port "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/server/usb/UsbMidiDevice$3;->val$portF:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1e

    .line 265
    :catch_42
    move-exception v0

    goto :goto_0
.end method
