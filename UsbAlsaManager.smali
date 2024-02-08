.class public final Lcom/android/server/usb/UsbAlsaManager;
.super Ljava/lang/Object;
.source "UsbAlsaManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/usb/UsbAlsaManager$1;,
        Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;
    }
.end annotation


# static fields
.field private static final ALSA_DIRECTORY:Ljava/lang/String; = "/dev/snd/"

.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

.field private final mAlsaDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;",
            ">;"
        }
    .end annotation
.end field

.field private final mAlsaObserver:Landroid/os/FileObserver;

.field private final mAudioDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/usb/UsbDevice;",
            "Lcom/android/server/usb/UsbAudioDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mAudioService:Landroid/media/IAudioService;

.field private final mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

.field private final mContext:Landroid/content/Context;

.field private final mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

.field private final mHasMidiFeature:Z

.field private mIsInputHeadset:Z

.field private mIsOutputHeadset:Z

.field private final mMidiDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/hardware/usb/UsbDevice;",
            "Lcom/android/server/usb/UsbMidiDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;


# direct methods
.method static synthetic -wrap0(Lcom/android/server/usb/UsbAlsaManager;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbAlsaManager;->alsaFileAdded(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap1(Lcom/android/server/usb/UsbAlsaManager;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/usb/UsbAlsaManager;->alsaFileRemoved(Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    const-class v0, Lcom/android/server/usb/UsbAlsaManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    .line 49
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-direct {v0}, Lcom/android/internal/alsa/AlsaCardsParser;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    .line 60
    new-instance v0, Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-direct {v0}, Lcom/android/internal/alsa/AlsaDevicesParser;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioDevices:Ljava/util/HashMap;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mMidiDevices:Ljava/util/HashMap;

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    .line 77
    iput-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    .line 80
    iput-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    .line 116
    new-instance v0, Lcom/android/server/usb/UsbAlsaManager$1;

    const-string/jumbo v1, "/dev/snd/"

    .line 117
    const/16 v2, 0x300

    .line 116
    invoke-direct {v0, p0, v1, v2}, Lcom/android/server/usb/UsbAlsaManager$1;-><init>(Lcom/android/server/usb/UsbAlsaManager;Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaObserver:Landroid/os/FileObserver;

    .line 131
    iput-object p1, p0, Lcom/android/server/usb/UsbAlsaManager;->mContext:Landroid/content/Context;

    .line 132
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string/jumbo v1, "android.software.midi"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mHasMidiFeature:Z

    .line 135
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v0}, Lcom/android/internal/alsa/AlsaCardsParser;->scan()V

    .line 136
    return-void
.end method

.method private alsaFileAdded(Ljava/lang/String;)V
    .registers 8

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 259
    const-string/jumbo v1, "pcmC"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 260
    const-string/jumbo v1, "p"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_77

    move v1, v2

    .line 269
    :goto_16
    if-eqz v1, :cond_76

    .line 271
    const/16 v0, 0x43

    :try_start_1a
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 272
    const/16 v0, 0x44

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 273
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 274
    if-eq v1, v2, :cond_2c

    if-ne v1, v3, :cond_2e

    .line 276
    :cond_2c
    add-int/lit8 v0, v0, -0x1

    .line 278
    :cond_2e
    add-int/lit8 v2, v4, 0x1

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 279
    add-int/lit8 v3, v5, 0x1

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_41} :catch_8e

    move-result v0

    .line 284
    iget-object v3, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    monitor-enter v3

    .line 285
    :try_start_45
    iget-object v4, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_75

    .line 286
    new-instance v4, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    invoke-direct {v4, p0, v1, v2, v0}, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;-><init>(Lcom/android/server/usb/UsbAlsaManager;III)V

    .line 287
    sget-object v0, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Adding ALSA device "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->notifyAll()V
    :try_end_75
    .catchall {:try_start_45 .. :try_end_75} :catchall_a9

    :cond_75
    monitor-exit v3

    .line 293
    :cond_76
    return-void

    .line 262
    :cond_77
    const-string/jumbo v1, "c"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ac

    move v1, v3

    .line 263
    goto :goto_16

    .line 265
    :cond_82
    const-string/jumbo v1, "midiC"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ac

    .line 266
    const/4 v0, 0x3

    move v1, v0

    goto :goto_16

    .line 280
    :catch_8e
    move-exception v0

    .line 281
    sget-object v1, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not parse ALSA file name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 282
    return-void

    .line 284
    :catchall_a9
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_ac
    move v1, v0

    goto/16 :goto_16
.end method

.method private alsaFileRemoved(Ljava/lang/String;)V
    .registers 7

    .prologue
    .line 296
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    monitor-enter v1

    .line 297
    :try_start_3
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    .line 298
    if-eqz v0, :cond_26

    .line 299
    sget-object v2, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "ALSA device removed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_28

    :cond_26
    monitor-exit v1

    .line 302
    return-void

    .line 296
    :catchall_28
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private notifyDeviceState(Lcom/android/server/usb/UsbAudioDevice;Z)V
    .registers 9

    .prologue
    const/4 v2, 0x0

    .line 161
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioService:Landroid/media/IAudioService;

    if-nez v0, :cond_e

    .line 162
    sget-object v0, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "no AudioService"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return-void

    .line 171
    :cond_e
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 172
    const-string/jumbo v1, "usb_audio_automatic_routing_disabled"

    .line 171
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 173
    if-eqz v0, :cond_1e

    .line 174
    return-void

    .line 177
    :cond_1e
    if-eqz p2, :cond_21

    const/4 v2, 0x1

    .line 178
    :cond_21
    iget v0, p1, Lcom/android/server/usb/UsbAudioDevice;->mCard:I

    .line 179
    iget v1, p1, Lcom/android/server/usb/UsbAudioDevice;->mDevice:I

    .line 180
    if-ltz v0, :cond_29

    if-gez v1, :cond_4e

    .line 181
    :cond_29
    sget-object v2, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid alsa card or device alsaCard: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 182
    const-string/jumbo v3, " alsaDevice: "

    .line 181
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    return-void

    .line 186
    :cond_4e
    invoke-static {v0, v1}, Lcom/android/server/audio/AudioService;->makeAlsaAddressString(II)Ljava/lang/String;

    move-result-object v3

    .line 189
    :try_start_52
    iget-boolean v0, p1, Lcom/android/server/usb/UsbAudioDevice;->mHasPlayback:Z

    if-eqz v0, :cond_67

    .line 191
    iget-boolean v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mIsOutputHeadset:Z

    if-eqz v0, :cond_7d

    .line 192
    const/high16 v1, 0x4000000

    .line 202
    :goto_5c
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioService:Landroid/media/IAudioService;

    .line 203
    invoke-virtual {p1}, Lcom/android/server/usb/UsbAudioDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    .line 202
    invoke-interface/range {v0 .. v5}, Landroid/media/IAudioService;->setWiredDeviceConnectionState(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    :cond_67
    iget-boolean v0, p1, Lcom/android/server/usb/UsbAudioDevice;->mHasCapture:Z

    if-eqz v0, :cond_7c

    .line 209
    iget-boolean v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mIsInputHeadset:Z

    if-eqz v0, :cond_87

    .line 210
    const/high16 v1, -0x7e000000

    .line 216
    :goto_71
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioService:Landroid/media/IAudioService;

    .line 217
    invoke-virtual {p1}, Lcom/android/server/usb/UsbAudioDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    .line 216
    invoke-interface/range {v0 .. v5}, Landroid/media/IAudioService;->setWiredDeviceConnectionState(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    :cond_7c
    :goto_7c
    return-void

    .line 194
    :cond_7d
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    if-ne p1, v0, :cond_84

    .line 195
    const/16 v1, 0x2000

    goto :goto_5c

    .line 196
    :cond_84
    const/16 v1, 0x4000

    goto :goto_5c

    .line 212
    :cond_87
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;
    :try_end_89
    .catch Landroid/os/RemoteException; {:try_start_52 .. :try_end_89} :catch_93

    if-ne p1, v0, :cond_8f

    .line 213
    const v1, -0x7ffff800

    goto :goto_71

    .line 214
    :cond_8f
    const v1, -0x7ffff000

    goto :goto_71

    .line 219
    :catch_93
    move-exception v0

    .line 220
    sget-object v0, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "RemoteException in setWiredDeviceConnectionState"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7c
.end method

.method private waitForAlsaDevice(III)Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;
    .registers 12

    .prologue
    .line 229
    new-instance v0, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    invoke-direct {v0, p0, p3, p1, p2}, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;-><init>(Lcom/android/server/usb/UsbAlsaManager;III)V

    .line 234
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    monitor-enter v1

    .line 235
    :try_start_8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x9c4

    add-long/2addr v2, v4

    .line 237
    :cond_f
    iget-object v4, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_5c

    move-result v4

    if-eqz v4, :cond_1d

    monitor-exit v1

    .line 238
    return-object v0

    .line 240
    :cond_1d
    :try_start_1d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_5c

    move-result-wide v4

    sub-long v4, v2, v4

    .line 241
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_2e

    .line 243
    :try_start_29
    iget-object v6, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaDevices:Ljava/util/HashMap;

    invoke-virtual {v6, v4, v5}, Ljava/util/HashMap;->wait(J)V
    :try_end_2e
    .catch Ljava/lang/InterruptedException; {:try_start_29 .. :try_end_2e} :catch_52
    .catchall {:try_start_29 .. :try_end_2e} :catchall_5c

    .line 248
    :cond_2e
    :goto_2e
    :try_start_2e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_5c

    move-result-wide v4

    cmp-long v4, v2, v4

    if-gtz v4, :cond_f

    monitor-exit v1

    .line 251
    sget-object v1, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "waitForAlsaDevice failed for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    const/4 v0, 0x0

    return-object v0

    .line 244
    :catch_52
    move-exception v4

    .line 245
    :try_start_53
    sget-object v4, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "usb: InterruptedException while waiting for ALSA file."

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5b
    .catchall {:try_start_53 .. :try_end_5b} :catchall_5c

    goto :goto_2e

    .line 234
    :catchall_5c
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public dump(Lcom/android/internal/util/IndentingPrintWriter;)V
    .registers 6

    .prologue
    .line 529
    const-string/jumbo v0, "USB Audio Devices:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 530
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 531
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioDevices:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_10

    .line 533
    :cond_49
    const-string/jumbo v0, "USB MIDI Devices:"

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    .line 534
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mMidiDevices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_59
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_92

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/usb/UsbDevice;

    .line 535
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/usb/UsbAlsaManager;->mMidiDevices:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/util/IndentingPrintWriter;->println(Ljava/lang/String;)V

    goto :goto_59

    .line 537
    :cond_92
    return-void
.end method

.method selectAudioCard(I)Lcom/android/server/usb/UsbAudioDevice;
    .registers 10

    .prologue
    const/4 v1, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 312
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v0, p1}, Lcom/android/internal/alsa/AlsaCardsParser;->isCardUsb(I)Z

    move-result v0

    if-nez v0, :cond_c

    .line 314
    return-object v7

    .line 317
    :cond_c
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v0}, Lcom/android/internal/alsa/AlsaDevicesParser;->scan()V

    .line 318
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v0, p1}, Lcom/android/internal/alsa/AlsaDevicesParser;->getDefaultDeviceNum(I)I

    move-result v2

    .line 320
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v0, p1}, Lcom/android/internal/alsa/AlsaDevicesParser;->hasPlaybackDevices(I)Z

    move-result v3

    .line 321
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v0, p1}, Lcom/android/internal/alsa/AlsaDevicesParser;->hasCaptureDevices(I)Z

    move-result v4

    .line 327
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v0, p1}, Lcom/android/internal/alsa/AlsaCardsParser;->isCardUsb(I)Z

    move-result v0

    if-eqz v0, :cond_38

    move v0, v1

    .line 330
    :goto_2c
    const/high16 v5, -0x80000000

    .line 327
    or-int/2addr v5, v0

    .line 333
    if-eqz v3, :cond_3a

    invoke-direct {p0, p1, v2, v6}, Lcom/android/server/usb/UsbAlsaManager;->waitForAlsaDevice(III)Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    move-result-object v0

    if-nez v0, :cond_3a

    .line 334
    return-object v7

    :cond_38
    move v0, v6

    .line 329
    goto :goto_2c

    .line 338
    :cond_3a
    if-eqz v4, :cond_43

    invoke-direct {p0, p1, v2, v1}, Lcom/android/server/usb/UsbAlsaManager;->waitForAlsaDevice(III)Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    move-result-object v0

    if-nez v0, :cond_43

    .line 339
    return-object v7

    .line 343
    :cond_43
    new-instance v0, Lcom/android/server/usb/UsbAudioDevice;

    move v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/usb/UsbAudioDevice;-><init>(IIZZI)V

    .line 344
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v1, p1}, Lcom/android/internal/alsa/AlsaCardsParser;->getCardRecordFor(I)Lcom/android/internal/alsa/AlsaCardsParser$AlsaCardRecord;

    move-result-object v1

    .line 345
    iget-object v2, v1, Lcom/android/internal/alsa/AlsaCardsParser$AlsaCardRecord;->mCardName:Ljava/lang/String;

    iget-object v1, v1, Lcom/android/internal/alsa/AlsaCardsParser$AlsaCardRecord;->mCardDescription:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/android/server/usb/UsbAudioDevice;->setDeviceNameAndDescription(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    invoke-direct {p0, v0, v6}, Lcom/android/server/usb/UsbAlsaManager;->notifyDeviceState(Lcom/android/server/usb/UsbAudioDevice;Z)V

    .line 349
    return-object v0
.end method

.method selectDefaultDevice()Lcom/android/server/usb/UsbAudioDevice;
    .registers 2

    .prologue
    .line 356
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v0}, Lcom/android/internal/alsa/AlsaCardsParser;->getDefaultCard()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbAlsaManager;->selectAudioCard(I)Lcom/android/server/usb/UsbAudioDevice;

    move-result-object v0

    return-object v0
.end method

.method setAccessoryAudioState(ZII)V
    .registers 10

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 477
    if-eqz p1, :cond_15

    .line 478
    new-instance v0, Lcom/android/server/usb/UsbAudioDevice;

    .line 479
    const/4 v5, 0x2

    move v1, p2

    move v2, p3

    .line 478
    invoke-direct/range {v0 .. v5}, Lcom/android/server/usb/UsbAudioDevice;-><init>(IIZZI)V

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    .line 480
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    invoke-direct {p0, v0, v3}, Lcom/android/server/usb/UsbAlsaManager;->notifyDeviceState(Lcom/android/server/usb/UsbAudioDevice;Z)V

    .line 485
    :cond_14
    :goto_14
    return-void

    .line 481
    :cond_15
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    if-eqz v0, :cond_14

    .line 482
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    invoke-direct {p0, v0, v4}, Lcom/android/server/usb/UsbAlsaManager;->notifyDeviceState(Lcom/android/server/usb/UsbAudioDevice;Z)V

    .line 483
    iput-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mAccessoryAudioDevice:Lcom/android/server/usb/UsbAudioDevice;

    goto :goto_14
.end method

.method setPeripheralMidiState(ZII)V
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 488
    iget-boolean v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mHasMidiFeature:Z

    if-nez v0, :cond_6

    .line 489
    return-void

    .line 492
    :cond_6
    if-eqz p1, :cond_53

    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    if-nez v0, :cond_53

    .line 493
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 494
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 495
    const-string/jumbo v2, "name"

    .line 496
    const v3, 0x1040604

    .line 495
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    const-string/jumbo v2, "manufacturer"

    .line 498
    const v3, 0x1040603

    .line 497
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const-string/jumbo v2, "product"

    .line 500
    const v3, 0x1040605

    .line 499
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    const-string/jumbo v1, "alsa_card"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 502
    const-string/jumbo v1, "alsa_device"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 503
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mContext:Landroid/content/Context;

    invoke-static {v1, v0, p2, p3}, Lcom/android/server/usb/UsbMidiDevice;->create(Landroid/content/Context;Landroid/os/Bundle;II)Lcom/android/server/usb/UsbMidiDevice;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    .line 508
    :cond_52
    :goto_52
    return-void

    .line 504
    :cond_53
    if-nez p1, :cond_52

    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    if-eqz v0, :cond_52

    .line 505
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 506
    iput-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mPeripheralMidiDevice:Lcom/android/server/usb/UsbMidiDevice;

    goto :goto_52
.end method

.method public systemReady()V
    .registers 4

    .prologue
    .line 140
    const-string/jumbo v0, "audio"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 139
    invoke-static {v0}, Landroid/media/IAudioService$Stub;->asInterface(Landroid/os/IBinder;)Landroid/media/IAudioService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioService:Landroid/media/IAudioService;

    .line 142
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAlsaObserver:Landroid/os/FileObserver;

    invoke-virtual {v0}, Landroid/os/FileObserver;->startWatching()V

    .line 145
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/dev/snd/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 146
    if-eqz v1, :cond_30

    .line 147
    const/4 v0, 0x0

    :goto_21
    array-length v2, v1

    if-ge v0, v2, :cond_30

    .line 148
    aget-object v2, v1, v0

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/server/usb/UsbAlsaManager;->alsaFileAdded(Ljava/lang/String;)V

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 151
    :cond_30
    return-void
.end method

.method usbDeviceAdded(Landroid/hardware/usb/UsbDevice;ZZ)V
    .registers 11

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 366
    iput-boolean p2, p0, Lcom/android/server/usb/UsbAlsaManager;->mIsInputHeadset:Z

    .line 367
    iput-boolean p3, p0, Lcom/android/server/usb/UsbAlsaManager;->mIsOutputHeadset:Z

    .line 373
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I

    move-result v3

    move v2, v0

    .line 374
    :goto_b
    if-nez v0, :cond_1d

    if-ge v2, v3, :cond_1d

    .line 376
    invoke-virtual {p1, v2}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    move-result-object v4

    .line 377
    invoke-virtual {v4}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    move-result v4

    if-ne v4, v1, :cond_1a

    move v0, v1

    .line 375
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 385
    :cond_1d
    if-nez v0, :cond_20

    .line 386
    return-void

    .line 389
    :cond_20
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v0}, Lcom/android/internal/alsa/AlsaCardsParser;->getDefaultUsbCard()I

    move-result v0

    .line 397
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mCardsParser:Lcom/android/internal/alsa/AlsaCardsParser;

    invoke-virtual {v1, v0}, Lcom/android/internal/alsa/AlsaCardsParser;->isCardUsb(I)Z

    move-result v1

    if-eqz v1, :cond_ce

    .line 398
    invoke-virtual {p0, v0}, Lcom/android/server/usb/UsbAlsaManager;->selectAudioCard(I)Lcom/android/server/usb/UsbAudioDevice;

    move-result-object v1

    .line 399
    if-eqz v1, :cond_52

    .line 400
    iget-object v2, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioDevices:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    sget-object v2, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "USB Audio Device Added: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    :cond_52
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v1, v0}, Lcom/android/internal/alsa/AlsaDevicesParser;->hasMIDIDevices(I)Z

    move-result v1

    .line 411
    if-eqz v1, :cond_ce

    iget-boolean v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mHasMidiFeature:Z

    if-eqz v1, :cond_ce

    .line 412
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mDevicesParser:Lcom/android/internal/alsa/AlsaDevicesParser;

    invoke-virtual {v1, v0}, Lcom/android/internal/alsa/AlsaDevicesParser;->getDefaultDeviceNum(I)I

    move-result v1

    .line 413
    const/4 v2, 0x3

    invoke-direct {p0, v0, v1, v2}, Lcom/android/server/usb/UsbAlsaManager;->waitForAlsaDevice(III)Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;

    move-result-object v3

    .line 414
    if-eqz v3, :cond_ce

    .line 415
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 416
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getManufacturerName()Ljava/lang/String;

    move-result-object v1

    .line 417
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getProductName()Ljava/lang/String;

    move-result-object v2

    .line 418
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getVersion()Ljava/lang/String;

    move-result-object v5

    .line 420
    if-eqz v1, :cond_84

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_cf

    :cond_84
    move-object v0, v2

    .line 427
    :goto_85
    const-string/jumbo v6, "name"

    invoke-virtual {v4, v6, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    const-string/jumbo v0, "manufacturer"

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    const-string/jumbo v0, "product"

    invoke-virtual {v4, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    const-string/jumbo v0, "version"

    invoke-virtual {v4, v0, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    const-string/jumbo v0, "serial_number"

    .line 432
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v1

    .line 431
    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    const-string/jumbo v0, "alsa_card"

    iget v1, v3, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;->mCard:I

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 434
    const-string/jumbo v0, "alsa_device"

    iget v1, v3, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;->mDevice:I

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 435
    const-string/jumbo v0, "usb_device"

    invoke-virtual {v4, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 437
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mContext:Landroid/content/Context;

    .line 438
    iget v1, v3, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;->mCard:I

    iget v2, v3, Lcom/android/server/usb/UsbAlsaManager$AlsaDevice;->mDevice:I

    .line 437
    invoke-static {v0, v4, v1, v2}, Lcom/android/server/usb/UsbMidiDevice;->create(Landroid/content/Context;Landroid/os/Bundle;II)Lcom/android/server/usb/UsbMidiDevice;

    move-result-object v0

    .line 439
    if-eqz v0, :cond_ce

    .line 440
    iget-object v1, p0, Lcom/android/server/usb/UsbAlsaManager;->mMidiDevices:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    :cond_ce
    return-void

    .line 422
    :cond_cf
    if-eqz v2, :cond_d7

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d9

    :cond_d7
    move-object v0, v1

    .line 423
    goto :goto_85

    .line 425
    :cond_d9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v6, " "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_85
.end method

.method usbDeviceRemoved(Landroid/hardware/usb/UsbDevice;)V
    .registers 6

    .prologue
    .line 457
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mAudioDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbAudioDevice;

    .line 458
    sget-object v1, Lcom/android/server/usb/UsbAlsaManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "USB Audio Device Removed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    if-eqz v0, :cond_32

    .line 460
    iget-boolean v1, v0, Lcom/android/server/usb/UsbAudioDevice;->mHasPlayback:Z

    if-nez v1, :cond_2b

    iget-boolean v1, v0, Lcom/android/server/usb/UsbAudioDevice;->mHasCapture:Z

    if-eqz v1, :cond_32

    .line 461
    :cond_2b
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/server/usb/UsbAlsaManager;->notifyDeviceState(Lcom/android/server/usb/UsbAudioDevice;Z)V

    .line 464
    invoke-virtual {p0}, Lcom/android/server/usb/UsbAlsaManager;->selectDefaultDevice()Lcom/android/server/usb/UsbAudioDevice;

    .line 467
    :cond_32
    iget-object v0, p0, Lcom/android/server/usb/UsbAlsaManager;->mMidiDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/usb/UsbMidiDevice;

    .line 468
    if-eqz v0, :cond_3f

    .line 469
    invoke-static {v0}, Llibcore/io/IoUtils;->closeQuietly(Ljava/lang/AutoCloseable;)V

    .line 471
    :cond_3f
    return-void
.end method
