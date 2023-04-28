package com.example.stylish_max

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull
import com.example.stylish_max.TappayHelper.getPrime
import com.example.stylish_max.TappayHelper.isCardValid
import com.example.stylish_max.TappayHelper.setupTappay

class MainActivity: FlutterActivity() {
    private val CHANNEL = "tappay_channel"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    METHOD_SET_UP_TAPPAY -> {
                        val appId: Int? = call.argument("appId")
                        val appKey: String? = call.argument("appKey")
                        val serverType: String? = call.argument("serverType")
                        setupTappay(
                            this@MainActivity,
                            appId,
                            appKey,
                            serverType,
                            errorMessage = { result.error("", it, "") },
                        )
                    }

                    METHOD_IS_CARD_VALID -> {
                        val cardNumber: String? = call.argument("cardNumber")
                        val dueMonth: String? = call.argument("dueMonth")
                        val dueYear: String? = call.argument("dueYear")
                        val ccv: String? = call.argument("ccv")
                        result.success(isCardValid(cardNumber, dueMonth, dueYear, ccv))
                    }

                    METHOD_GET_PRIME -> {
                        val cardNumber: String? = call.argument("cardNumber")
                        val dueMonth: String? = call.argument("dueMonth")
                        val dueYear: String? = call.argument("dueYear")
                        val ccv: String? = call.argument("ccv")
                        getPrime(
                            context = this@MainActivity,
                            cardNumber = cardNumber,
                            dueMonth = dueMonth,
                            dueYear = dueYear,
                            ccv = ccv,
                            prime = {
                                result.success(it)
                            },
                            failCallBack = {
                                result.success(it)
                            },
                        )
                    }
                }
            }
    }

    companion object {
        private const val METHOD_SET_UP_TAPPAY = "METHOD_SET_UP_TAPPAY"
        private const val METHOD_IS_CARD_VALID = "METHOD_IS_CARD_VALID"
        private const val METHOD_GET_PRIME = "METHOD_GET_PRIME"
    }
}
